{{- define "common.name" -}}
  # this function does not exist and should error
	{{- include "uncommon.name" . -}}
{{- end -}}
