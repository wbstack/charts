{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mediawiki.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mediawiki.fullname" -}}
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
{{- define "mediawiki.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "mediawiki.labels" -}}
app.kubernetes.io/name: {{ include "mediawiki.name" . }}
helm.sh/chart: {{ include "mediawiki.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Common deployment environment variables
*/}}
{{- define "mediawiki.env" -}}
- name: MW_DB_SERVER_MASTER
  value: {{ .Values.mw.db.master }}
- name: MW_DB_SERVER_REPLICA
  value: {{ .Values.mw.db.replica }}
- name: MW_REDIS_SERVER_READ
  value: {{ .Values.mw.redis.readServer }}
- name: MW_REDIS_SERVER_WRITE
  value: {{ .Values.mw.redis.writeServer }}
- name: MW_REDIS_PASSWORD
{{- if .Values.mw.redis.password }}
  value: {{ .Values.mw.redis.password | quote }}
{{- end }}
{{- if .Values.mw.redis.passwordSecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.mw.redis.passwordSecretName | quote }}
      key: {{ .Values.mw.redis.passwordSecretKey | quote }}
{{- end }}
- name: MW_ELASTICSEARCH_HOST
  value: {{ .Values.mw.elasticsearch.host }}
- name: MW_ELASTICSEARCH_PORT
  value: {{ .Values.mw.elasticsearch.port | quote }}
- name: MW_MAILGUN_DISABLED
{{- if .Values.mw.mailgun.enabled }}
  value: "no"
{{- else }}
  value: "yes"
{{- end }}
- name: MW_MAILGUN_API_KEY
{{- if .Values.mw.mailgun.apikey }}
  value: {{ .Values.mw.mailgun.apikey | quote }}
{{- end }}
{{- if .Values.mw.mailgun.apikeySecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.mw.mailgun.apikeySecretName | quote }}
      key: {{ .Values.mw.mailgun.apikeySecretKey | quote }}
{{- end }}
- name: MW_MAILGUN_DOMAIN
  value: {{ .Values.mw.mail.domain }}
- name: MW_MAILGUN_ENDPOINT
  value: {{ .Values.mw.mailgun.endpoint }}
- name: MW_EMAIL_DOMAIN
  value: {{ .Values.mw.mail.domain }}
- name: MW_RECAPTCHA_SITEKEY
{{- if .Values.mw.recaptcha.sitekey }}
  value: {{ .Values.mw.recaptcha.sitekey | quote }}
{{- end }}
{{- if .Values.mw.recaptcha.sitekeySecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.mw.recaptcha.sitekeySecretName | quote }}
      key: {{ .Values.mw.recaptcha.sitekeySecretKey | quote }}
{{- end }}
- name: MW_RECAPTCHA_SECRETKEY
{{- if .Values.mw.recaptcha.secretkey }}
  value: {{ .Values.mw.recaptcha.secretkey | quote }}
{{- end }}
{{- if .Values.mw.recaptcha.secretkeySecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.mw.recaptcha.secretkeySecretName | quote }}
      key: {{ .Values.mw.recaptcha.secretkeySecretKey | quote }}
{{- end }}
- name: PLATFORM_API_BACKEND_HOST
  value: {{ .Values.mw.platform.apiBackendHost }}
{{- if .Values.mw.settings.logToStdErr }}
- name: MW_LOG_TO_STDERR
  value: "yes"
{{- end }}
- name: MW_SMTP_ENABLED
{{- if .Values.mw.smtp.enabled }}
  value: "yes"
{{- else }}
  value: "no"
{{- end }}
- name: MW_SMTP_HOST
  value: {{ .Values.mw.smtp.host | quote }}
- name: MW_SMTP_PORT
  value: {{ .Values.mw.smtp.port | quote }}
- name: MW_SMTP_AUTH
  value: {{ .Values.mw.smtp.auth | quote }}

{{- if .Values.mw.smtp.enabled }}

- name: MW_SMTP_USERNAME
  {{- if .Values.mw.smtp.username }}
  value: {{ .Values.mw.smtp.username | quote }}
  {{- end }}
  {{- if .Values.mw.smtp.smtpUserSecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.mw.smtp.smtpUserSecretName | quote }}
      key: {{ .Values.mw.smtp.smtpUserSecretKey | quote }}
  {{- end }}

- name: MW_SMTP_PASSWORD
  {{- if .Values.mw.smtp.password }}
  value: {{ .Values.mw.smtp.password | quote }}
  {{- end }}
  {{- if .Values.mw.smtp.smtpPasswordSecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.mw.smtp.smtpPasswordSecretName | quote }}
      key: {{ .Values.mw.smtp.smtpPasswordSecretKey | quote }}
  {{- end }}

{{- end -}}

{{- end -}}

{{/*
Common deployment probes
*/}}
{{- define "mediawiki.probes" -}}
livenessProbe:
  httpGet:
    path: /w/health.php
    port: http
readinessProbe:
  httpGet:
    path: /w/health.php
    port: http
{{- end -}}
