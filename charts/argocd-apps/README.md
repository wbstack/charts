# argocd-apps

Deploys actual `Application` manifests for Argo CD. This chart gets treated as it's own `Application`, the app-of-apps, by the chart [argocd-config](../argocd-config/README.md).

## Changelog
## 1.1.0
- move app chart versions to values file
- use helm chart notation instead for the ui
- remove git repo url for wbstack/charts

## 1.0.7
- add redis-2 manifest

## 1.0.6
- add redis manifest

## 1.0.5
- use wbaas-api chart v0.32.1

## 1.0.4
- use wbaas-api chart v0.32.0

## 1.0.3
- unspecified version bump

### 1.0.2
- add wbstack helm charts repo
- add wbaas-api manifest 

### 1.0.1
- initial version in this repository
- includes wbaas-ui manifest