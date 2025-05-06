## values.yaml variable does not exist

Command
```
> ./bin/helm template .
```

Expected output
```
Error: values_variable_doesnt_exist/templates/secret.yaml:6:18
  executing "values_variable_doesnt_exist/templates/secret.yaml" at <.Values.should_be_nested.nested.nested_1.nested_2.nested_3>:
    nil pointer evaluating interface {}.nested_2

Use --debug flag to render out invalid YAML
```
