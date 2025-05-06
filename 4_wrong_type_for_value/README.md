## Wrong type

Command
```
> ./bin/helm template .
```

Expected output
```
Error: wrong_type/templates/secret.yaml:6:11
  executing "wrong_type/templates/secret.yaml" at <include "getVar" .>:
    error calling include:
wrong_type/templates/_helpers.tpl:3:16
  executing "getVar" at <.Values.service.ports>:
    wrong type for value; expected map[string]interface {}; got json.Number

Use --debug flag to render out invalid YAML
```
