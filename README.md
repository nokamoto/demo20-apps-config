# demo20-apps-config
application configurations for demo

## Run
```bash
$ helm install local apps
```

## Argo CD
```bash
$ helm install cd argocd
$ helm install app-of-apps app-of-apps
$ kubectl port-forward svc/cd-argocd-server 8080:80
```
