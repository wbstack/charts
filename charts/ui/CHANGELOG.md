# ui

This chart does not yet follow SemVer.

## 0.2.8

- Make CNAME_RECORD configurable

## 0.2.7

- Add support for specifying CNAME_RECORD, bump image to 3.3

## 0.2.6

- Only load recaptcha secret if set

## 0.2.5

- Bump image to 3.2 with wikibase.cloud UI

## 0.2.4:

- Change service from `NodePort` to `ClusterIP`
## 0.2.3

 - Change image pullPolicy values to `IfNotPresent`

## 0.2.2

- Fix recaptcha site key config name

## 0.2.1

- Fix image version number

## 0.2.0

- Switch to app 3.0
- Added `ui.recaptchaSitekeySecretName`
- Added `ui.recaptchaSitekeySecretKey`
- Added `ui.apiUrl`
- Added `ui.subdomainSuffix`

## 0.1.0

- First development version.
