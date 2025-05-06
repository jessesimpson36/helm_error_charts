## Divide by zero

Command
```
> ./bin/helm template .
```

Expected output
```
Error: template: divide_by_zero/templates/secret.yaml:6:11: executing "divide_by_zero/templates/secret.yaml" at <include "division" .>: error calling include: template: divide_by_zero/templates/_helpers_1.tpl:2:6: executing "division" at <div 42 0>: error calling div: runtime error: integer divide by zero

Use --debug flag to render out invalid YAML
```
