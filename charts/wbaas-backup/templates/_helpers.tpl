{{/* vim: set filetype=mustache: */}}

{{- /*
## `backup.sharedPodConfiguration`

The restore pod and the CronJob share the same configuration.

Depending on the situation, if the CronJob is running or Restore-pod is running the `db` dict for this template
either will be set to use the `db.load` dict or the `db.dump` dict from the values configuration.

`db.load` is used when restoring and is by default configured to restore the primary sql instance
`db.dump` is used when backing up (through the CronJob) and is by default configured to take backups from the replica

*/}}

{{- define "backup.sharedPodConfiguration" -}}
volumeMounts:
  - name: "scratch-volume"
    mountPath: "/backups/"
{{- if .context.Values.storage.gcs.uploadToBucket }}
  - name: "service-account-volume"
    mountPath: "/var/run/secret/cloud.google.com"
lifecycle:
  postStart:
    exec:
      command: ["gcsfuse", "--key-file", "/var/run/secret/cloud.google.com/key.json", "{{ .context.Values.storage.gcs.bucketName }}", "/mnt/backup-bucket"]
  preStop:
    exec:
      command: ["fusermount", "-u", /mnt/backup-bucket"]
{{- end }}
securityContext:
  privileged: true
  capabilities:
    add:
      - SYS_ADMIN
env:
- name: DB_PASSWORD
  {{- if .db.passwordSecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .db.passwordSecretName | quote }}
      key: {{ .db.passwordSecretKey | quote }}
  {{- end }}
- name: DB_USER
  value: {{ .db.username | quote }}
- name: DB_HOST
  value: {{ .db.hostname | quote }}
- name: DB_PORT
  value: {{ .db.port | quote }}
- name: DO_UPLOAD
  value: {{ if .context.Values.storage.gcs.uploadToBucket }}"1"{{else}}"0"{{end}}
- name: GCS_BUCKET_NAME
  value: {{ .context.Values.storage.gcs.bucketName | quote }}
- name: BACKUP_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .context.Values.backupSecretName }}
      key: {{ .context.Values.backupSecretKey }}
{{- end -}}


{{- /*
## `backup.sharedVolumes`

Both the restore-pod and the CronJob requires the backup-bucket to be mounted in order for the backups to be persisted.
This template mounts the `.Values.gcs` of the values file into the template and configures the pod and the job in the same way.

The uid '1234' is defined in the wbaas-backup Dockerfile

*/}}
{{ define "backup.sharedVolumes" }}
securityContext:
  fsGroup: 1234
volumes:
  - name: scratch-volume
    ephemeral:
      volumeClaimTemplate:
        metadata:
          labels:
            type: scratch-volume-type
        spec:
          accessModes: [ "ReadWriteOnce" ]
          resources:
            requests:
              storage: {{ .storage.scratchDiskSpace | quote }}
{{- if .storage.gcs.uploadToBucket }}
  - name: "service-account-volume"
    secret:
      secretName: {{ .storage.gcs.serviceAccountSecretName | quote }}
{{- end }}
{{ end }}