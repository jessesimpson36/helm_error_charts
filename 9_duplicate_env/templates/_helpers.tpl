{{/*
Expand the name of the chart.
*/}}
{{- define "..name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "..fullname" -}}
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
{{- define "..chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "..labels" -}}
helm.sh/chart: {{ include "..chart" . }}
{{ include "..selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "..selectorLabels" -}}
app.kubernetes.io/name: {{ include "..name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "..serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "..fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "defaultEnvVars" -}}
{{- $envVars := list -}}

{{- $envVars = append $envVars (dict
    "name" "SERVER_CONTEXT_PATH"
    "value" "/operate"
) -}}
{{- $envVars -}}
{{- end -}}

{{- define "mergeEnvVars" -}}
{{- $defaultEnvBlock := .defaultEnvBlock | default "" -}}
{{- $userEnv := .userEnv | default list -}}
{{- $context := .context -}}

{{/* Shortcut: if no user env, just return default block as-is */}}
{{- if and $defaultEnvBlock (or (not $userEnv) (eq (len $userEnv) 0)) -}}
{{- $defaultEnvBlock -}}
{{- else if and $defaultEnvBlock $userEnv -}}

{{/* Parse default env vars from YAML string */}}
{{- $defaultEnv := $defaultEnvBlock | fromYamlArray | default list -}}
{{- if not (kindIs "slice" $defaultEnv) -}}
  {{- $defaultEnv = list $defaultEnv -}}
{{- end -}}

{{/* Process user env - already a list from values */}}
{{- $processedUserEnv := $userEnv -}}

{{/* Create a map to track env vars by name (preserves order for defaults, overrides with user values) */}}
{{- $envMap := dict -}}
{{- $envOrder := list -}}

{{/* Add default env vars to map and track order */}}
{{- range $defaultEnv -}}
  {{- if and (kindIs "map" .) .name -}}
    {{- $_ := set $envMap .name . -}}
    {{- $envOrder = append $envOrder .name -}}
  {{- end -}}
{{- end -}}

{{/* Override with user env vars (user values take priority) and track new vars */}}
{{- range $processedUserEnv -}}
  {{- if and (kindIs "map" .) .name -}}
    {{- if not (hasKey $envMap .name) -}}
      {{- /* New env var from user - add to order */ -}}
      {{- $envOrder = append $envOrder .name -}}
    {{- end -}}
    {{- $_ := set $envMap .name . -}}
  {{- end -}}
{{- end -}}

{{/* Convert map back to list in original order and output as YAML */}}
{{- $mergedEnv := list -}}
{{- range $envOrder -}}
  {{- if hasKey $envMap . -}}
    {{- $mergedEnv = append $mergedEnv (index $envMap .) -}}
  {{- end -}}
{{- end -}}

{{- toYaml $mergedEnv -}}
{{- end -}}
{{- end -}}
