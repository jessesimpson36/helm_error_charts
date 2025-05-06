# Examples of faulty helm charts for testing with better errors PR

This is for:

https://github.com/helm/helm/issues/13447

https://github.com/helm/helm/pull/13586


Inside each subdirectory there is an example chart that produces an error, and each subdirectory includes a README.md with the output of the error message when I run `helm template .` on a build of helm from my pull request.
