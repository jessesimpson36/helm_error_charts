## Divide by zero

Command
```
> ./bin/helm template .
```

Output

> Error: template: divide_by_zero/templates/secret.yaml:6:11: executing "divide_by_zero/templates/secret.yaml" at <include "division" .>: error calling include: template: divide_by_zero/templates/_helpers_1.tpl:2:6: executing "division" at <div 42 0>: error calling div: runtime error: integer divide by zero


This output was not entirely expected, but I'm not sure if it's wrong. I think the regex did not catch the final part of the error, so it fell back to the original error message. In the case of runtime errors, I'm not sure if it makes sense to format partially.
