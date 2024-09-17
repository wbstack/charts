lint:
	docker run --rm -it --user $(shell id -u) -v $(shell pwd):/repo -w /repo quay.io/helmpack/chart-testing:v3.4.0 ct lint --config ct.yml

.PHONY: lint