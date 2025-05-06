
{{- define "getVar" -}}
	{{- get .Values.service.ports "http" -}}
{{- end -}}
