# demo20-apps-config
application configurations for demo

## Run
```bash
$ helm install local apps
```

## Argo CD
pre-requisite: Secret
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: ghpat
  namespace: development
type: Opaque
data:
  ghpat: ... # nokamoto pat
```

```bash
$ helm install cd argocd
$ helm install app-of-apps app-of-apps
$ kubectl port-forward svc/cd-argocd-server 8080:80
```
