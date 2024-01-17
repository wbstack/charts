{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "api.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "api.labels" -}}
app.kubernetes.io/name: {{ include "api.name" . }}
helm.sh/chart: {{ include "api.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Common lists of environment variables
*/}}
{{- define "api.commonAppEnvVars" -}}
- name: WBSTACK_SUBDOMAIN_SUFFIX
  value: {{ .Values.wbstack.subdomainSuffix | quote }}
- name: WBSTACK_UI_URL
  value: {{ .Values.wbstack.uiurl | quote }}
- name: WBSTACK_WIKI_DB_PROVISION_VERSION
  value: {{ .Values.wbstack.wikiDbProvisionVersion | quote }}
- name: WBSTACK_WIKI_DB_USE_VERSION
  value: {{ .Values.wbstack.wikiDbUseVersion | quote }}
{{- if .Values.wbstack.maxWikisPerUser }}
- name: WBSTACK_MAX_PER_USER
  value: {{ .Values.wbstack.maxWikisPerUser | quote }}
{{- end }}
{{- if .Values.wbstack.summaryInactiveThreshold }}
- name: WBSTACK_SUMMARY_INACTIVE_THRESHOLD
  value: {{ .Values.wbstack.summaryInactiveThreshold | quote }}
{{- end }}
{{- if .Values.wbstack.summaryCreationRateRanges }}
- name: WBSTACK_SUMMARY_CREATION_RATE_RANGES
  value: {{ join "," .Values.wbstack.summaryCreationRateRanges | quote }}
{{- end }}
{{- if .Values.wbstack.signupThrottlingLimit }}
- name: WBSTACK_SIGNUP_THROTTLING_LIMIT
  value: {{ .Values.wbstack.signupThrottlingLimit | quote }}
{{- end }}
{{- if .Values.wbstack.signupThrottlingRange }}
- name: WBSTACK_SIGNUP_THROTTLING_RANGE
  value: {{ .Values.wbstack.signupThrottlingRange | quote }}
{{- end }}
{{- if .Values.wbstack.qsBatchPendingTimeout }}
- name: WBSTACK_QS_BATCH_PENDING_TIMEOUT
  value: {{ .Values.wbstack.qsBatchPendingTimeout | quote }}
{{- end }}
{{- if .Values.wbstack.qsBatchMarkFailedAfter }}
- name: WBSTACK_QS_BATCH_MARK_FAILED_AFTER
  value: {{ .Values.wbstack.qsBatchMarkFailedAfter | quote }}
{{- end }}
{{- if .Values.wbstack.qsBatchEntityLimit }}
- name: WBSTACK_QS_BATCH_ENTITY_LIMIT
  value: {{ .Values.wbstack.qsBatchEntityLimit | quote }}
{{- end }}
{{- if .Values.wbstack.contact.mail.recipient }}
- name: WBSTACK_CONTACT_MAIL_RECIPIENT
  value: {{ .Values.wbstack.contact.mail.recipient | quote }}
{{- end }}
{{- if .Values.wbstack.contact.mail.sender }}
- name: WBSTACK_CONTACT_MAIL_SENDER
  value: {{ .Values.wbstack.contact.mail.sender | quote }}
{{- end }}
{{- if .Values.wbstack.elasticSearch.enabledByDefault }}
- name: WBSTACK_ELASTICSEARCH_ENABLED_BY_DEFAULT
  value: {{ .Values.wbstack.elasticSearch.enabledByDefault | quote }}
{{- end }}
{{- if .Values.trustedProxy.proxies }}
- name: TRUSTED_PROXY_PROXIES
  value: {{ join "," .Values.trustedProxy.proxies | quote }}
{{- end }}
{{- end -}}

{{- define "api.staticStorageEnvVars" -}}
- name: STATIC_STORAGE_BUCKET_NAME
  valueFrom:
    configMapKeyRef:
      name: storage-bucket
      key: gcs_api_static_bucket_name
      optional: true
- name: STATIC_STORAGE_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.storage.accessKeySecretName | quote }}
      key: {{ .Values.storage.accessKeySecretKey | quote }}
- name: STATIC_STORAGE_SECRET_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.storage.secretKeySecretName | quote }}
      key: {{ .Values.storage.secretKeySecretKey | quote }}
- name: STATIC_STORAGE_ENDPOINT
  value: {{ .Values.storage.endpoint | quote }}
- name: STATIC_STORAGE_URL
  value: {{ .Values.storage.url | quote }}
- name: STATIC_STORAGE_USE_BUCKET_ENDPOINT
  value: {{ .Values.storage.useBucketEndpoint | quote }}
- name: STATIC_STORAGE_USE_PATH_STYLE_ENDPOINT
  value: {{ .Values.storage.usePathStyleEndpoint | quote }}
- name: STATIC_STORAGE_REGION
  value: {{ .Values.storage.region | quote }}
{{- end -}}

{{- define "api.smtpEnvVars" -}}
- name: MAIL_HOST
  value: {{ .Values.app.mail.smtphost | quote }}
- name: MAIL_PORT
  value: {{ .Values.app.mail.smtpport | quote }}
- name: MAIL_ENCRYPTION
  value: {{ .Values.app.mail.smtpencryption | quote }}

- name: MAIL_USERNAME
  {{- if .Values.app.mail.smtpuser }}
  value: {{ .Values.app.mail.smtpuser | quote }}
  {{- end }}
  {{- if .Values.app.mail.smtpUserSecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.app.mail.smtpUserSecretName | quote }}
      key: {{ .Values.app.mail.smtpUserSecretKey | quote }}
  {{- end }}

- name: MAIL_PASSWORD
  {{- if .Values.app.mail.smtppassword }}
  value: {{ .Values.app.mail.smtppassword | quote }}
  {{- end }}
  {{- if .Values.app.mail.smtpPasswordSecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.app.mail.smtpPasswordSecretName | quote }}
      key: {{ .Values.app.mail.smtpPasswordSecretKey | quote }}
  {{- end }}
{{- end -}}
