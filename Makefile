lint:
	docker run --rm -it -v $(shell pwd):/data --workdir=/data quay.io/helmpack/chart-testing:v3.11.0 bash -c "git config --global --add safe.directory /data; ct lint --config ct.yml"

.PHONY: lint