## Function not found, but in subcharts

Command
```
> ./bin/helm template .
```

Expected output
```
Error: function_not_found_nested/templates/secret.yaml:6:11
  executing "function_not_found_nested/templates/secret.yaml" at <include "common.name" .>:
    error calling include:
function_not_found_nested/charts/common/templates/_helpers_1.tpl:3:5
  executing "common.name" at <include "uncommon.name" .>:
    error calling include:
function_not_found_nested/charts/common/charts/uncommon/templates/_helpers_1.tpl:3:5
  executing "uncommon.name" at <include "common.names.get_name" .>:
    error calling include:
template: no template "common.names.get_name" associated with template "gotpl"
```
