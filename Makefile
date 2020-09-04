all:
	docker run -v $(PWD):/helm -w /helm --rm $$(docker build -q .) helm lint apps
