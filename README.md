# charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/wbstack)](https://artifacthub.io/packages/search?repo=wbstack)

This repository contains charts that can be used to deploy a wbstack like environment.

Some of these charts are pretty specific to the wbstack use case right now and could do with generalization.

Other charts are probably reusable as they are.

These charts are still in their early life and could do with becoming more uniform, documented and follow more best practices.

## Usage

```sh
helm repo add wbstack https://wbstack.github.io/charts
```

Or in a helmfile

```yaml
repositories:
- name: wbstack
  url: https://wbstack.github.io/charts
```

## Contributing

Anything merged into the `main` branch will result in releasing of new charts.

Releasing is powered by a github action.

Versions are built and tagged and created as github releases.

Github pages hosts the manifest file for all releases which is build on every release.

https://github.com/wbstack/charts/blob/gh-pages/index.yaml

OR

https://wbstack.github.io/charts/index.yaml

You can read more about releasing using these links:

- https://artifacthub.io/docs/topics/repositories/#helm-charts-repositories
- https://helm.sh/docs/howto/chart_releaser_action/
