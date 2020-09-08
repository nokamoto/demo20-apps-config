all:
	docker run -v $(PWD):/helm -w /helm --rm $$(docker build -q .) helm lint apps argocd app-of-apps

local:
	# https://github.com/argoproj/argo-cd/issues/3280
	# helm dep build apps
	helm install local apps

cd:
	# https://github.com/argoproj/argo-cd/issues/3280
	# helm dep build argocd
	helm install cd argocd --wait
	kubectl apply -f secret.yaml
	helm install app-of-apps app-of-apps
	until kubectl port-forward svc/cd-argocd-server 8080:80; do sleep 1; done
	
delete:
	helm uninstall local || echo
	helm uninstall cd || echo
	helm uninstall app-of-apps || echo
	kubectl delete -f secret.yaml
