{{/*
Expand the name of the chart.
*/}}
{{- define "writefreely.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "writefreely.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "writefreely.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "writefreely.labels" -}}
helm.sh/chart: {{ include "writefreely.chart" . }}
{{ include "writefreely.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "writefreely.selectorLabels" -}}
app.kubernetes.io/name: {{ include "writefreely.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "writefreely.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "writefreely.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "writefreely.mysql.fullname" -}}
{{- printf "%s-%s" .Release.Name "mysql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Get the mysql secret.
*/}}
{{- define "writefreely.mysql.secretName" -}}
{{- if (and (or .Values.mysql.enabled .Values.mysql.mysqlHostname) .Values.mysql.auth.existingSecret) }}
    {{- printf "%s" (tpl .Values.mysql.auth.existingSecret $) -}}
{{- else if and .Values.mysql.enabled (not .Values.mysql.auth.existingSecret) -}}
    {{- printf "%s-mysql" (tpl .Release.Name $) -}}
{{- else if and .Values.externalDatabase.enabled .Values.externalDatabase.existingSecret -}}
    {{- printf "%s" (tpl .Values.externalDatabase.existingSecret $) -}}
{{- else -}}
    {{- printf "%s" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}
