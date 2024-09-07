# Simple Kustomize

## Practices via official documentation

Kustomize came in handy when we integrated the whole cluster logic with vcs which practice start from configuration file directory

Noted: Due to lack of time, I provide only simple base and dev variants

```sh
| config folder
---- | base (store default component like deployment for frontend, service yaml, and kustomization yaml)
      --- deployment.yaml
      --- kustomization.yaml
      --- service.yaml
---- | overlays (variants referred to base component but in different environment like dev, prod, uat, sit)
      --- | dev
            --- kustomization.yaml (most important to avoid replication of mainfest)
            --- other patches yaml file to add on base file
      --- | prod (required kustomization file for config as base)
      --- | test (required kustomization file for config as base)

```
Vanilla apply for POC in task 3 by
```sh
// redirect to directory to deploy and apply via -k
kubectl apply -k .
```