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
{{- if .Values.wbstack.contact.mail.recipient }}
- name: WBSTACK_CONTACT_MAIL_RECIPIENT
  value: {{ .Values.wbstack.contact.mail.recipient | quote }}
{{- end }}
{{- if .Values.wbstack.contact.mail.sender }}
- name: WBSTACK_CONTACT_MAIL_SENDER
  value: {{ .Values.wbstack.contact.mail.sender | quote }}
{{- end }}
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
