> ℹ️ Issues for this repository are tracked on [Phabricator](https://phabricator.wikimedia.org/project/board/5563/) - ([Click here to open a new one](https://phabricator.wikimedia.org/maniphest/task/edit/form/1/?tags=wikibase_cloud
))

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



### Linting

This repository is linted using [chart-testing](https://github.com/helm/chart-testing).

This is both setup for Github Actions, and also runnable locally using a docker image.

```sh
make lint
```

### Releases

Anything merged into the `main` branch will result in releasing of new charts powered by Github Actions, and thus the touched chart versions must be bumped.]

Versions are built, tagged and created as github releases.

Github pages hosts the manifest file for all releases which is built on every release.
You can see the manifest in [the branch](https://github.com/wbstack/charts/blob/gh-pages/index.yaml) or on [github pages](https://wbstack.github.io/charts/index.yaml).

You can read more about releasing using these links:

- https://artifacthub.io/docs/topics/repositories/#helm-charts-repositories
- https://helm.sh/docs/howto/chart_releaser_action/
