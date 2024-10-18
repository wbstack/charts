# argocd-config

Configures permissions Argo CD and deploys the "app-of-apps" (see ../argocd-apps/README.md)

## Changelog
## 1.0.8
- use app-of-apps chart v1.0.6
- remove wbstack charts git repo URL

## 1.0.7
- use app-of-apps chart v1.0.5
- add bitnami chart repo URL

## 1.0.6
- use app-of-apps chart v1.0.4
- add allowed destination `in-cluster-monitoring` (needed for wbaas-api deployment)
- add `clusterResourceWhitelist` with ClusterRole and ClusterRoleBinding (needed for wbaas-api deployment)

## 1.0.5
- just a version bump due to chart release concurrency bug https://phabricator.wikimedia.org/T307481

## 1.0.4
- use app-of-apps chart v1.0.3

## 1.0.3
- use configurable wbstack chart URL instead of hardcoded string

## 1.0.2
- specify app-of-apps chart name
- add wbstack chart url to values file

### 1.0.1
- use app-of-apps chart 1.0.1

### 1.0.0
- initial version in this repository
