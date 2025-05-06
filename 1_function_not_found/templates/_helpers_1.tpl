{{- define "name" -}}
  # this function does not exist and should error
	{{- include "common.names.get_name" . -}}
{{- end -}}
