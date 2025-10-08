{{- define "name" -}}
	{{- tpl .Values.name . -}}
{{- end -}}

{{- define "jesseIsThinking" -}}
  {{- range $.Values.pizzaToppings }}
  - {{ . | title | quote }}
  {{- end }}
{{- end -}}
