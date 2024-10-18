# argocd-apps

Deploys actual `Application` manifests for Argo CD. This chart gets treated as it's own `Application`, the app-of-apps, by the chart [argocd-config](../argocd-config/README.md).

## Changelog
## 1.0.6
- use helm chart notation for wbaas-ui
- remove unused wbstack git repo URL 

## 1.0.5
- add redis manifest

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