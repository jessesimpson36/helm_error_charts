## Wrong error line numbers

Command
```
> ./bin/helm template .
```

Expected output
```
Error: template: wrong_error_line_numbers/templates/secret.yaml:6:11: executing "wrong_error_line_numbers/templates/secret.yaml" at <include "name" .>: error calling include: template: wrong_error_line_numbers/templates/_helpers_1.tpl:2:5: executing "name" at <tpl .Values.name .>: error calling tpl: error during tpl function execution for "{{- define \"jesseNameForgetterRememberer\" -}}\n  {{- include \"jesseIsThinking\" . -}}\n{{- end -}}\n{{ include \"jesseNameForgetterRememberer\" . }}\n{{- include \"triggerError\" . -}}\n": template: gotpl:5:4: executing "gotpl" at <include "triggerError" .>: error calling include: template: no template "triggerError" associated with template "gotpl"

Use --debug flag to render out invalid YAML
```
