## Function not found

Command
```
> ./bin/helm template .
```

Expected output
```
Error: function_not_found/templates/secret.yaml:6:11
  executing "function_not_found/templates/secret.yaml" at <include "name" .>:
    error calling include:
function_not_found/templates/_helpers_1.tpl:3:5
  executing "name" at <include "common.names.get_name" .>:
    error calling include:
template: no template "common.names.get_name" associated with template "gotpl"

Use --debug flag to render out invalid YAML
```
