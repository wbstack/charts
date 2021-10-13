lint:
	docker run --rm -it -v $(shell pwd):/repo -w /repo quay.io/helmpack/chart-testing:v2.5.0 ct lint --config ct.yml

.PHONY: lint