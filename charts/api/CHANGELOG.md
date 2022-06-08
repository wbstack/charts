# api

This chart does not yet follow SemVer.

## 0.19.11

- Fallback to defaults defined in app
- deduplicate common app env vars
## 0.19.10

- Use image version to 8x.8.8
## 0.19.9

- Removing maxWikisPerUser default value 
- Bump image version to 8x.8.8
- Adding support for env vars WBSTACK_MONITORING_EMAIL, WBSTACK_SUMMARY_INACTIVE_THRESHOLD

## 0.19.8

- Allow WBSTACK_MAX_PER_USER to be configurable to limit number of wikis created per user

## 0.19.7

- Allow CURLOPT_TIMEOUT_ELASTICSEARCH_INIT to be configurable

## 0.19.6

- Bump api image to `8x.8.6`

## 0.19.5

- Bump api image to `8x.8.5`

## 0.19.4

- Bump api image to `8x.8.4`

## 0.19.3

- Bump api image to `8x.8.3`

## 0.19.2

- Bump api image to `8x.8.2`

## 0.19.1

- Bump api image to `8x.8.1`

## 0.19.0

- Bump api image to `8x.8.0`
- Add custom domain migration
- Fixes bug in custom domain wikis

## 0.18.0

- Added support for SMTP credentials through secrets
## 0.17.0

- Bump api image to `8x.7.0`
## 0.16.1

- Bump api image to `8x.6.1`
## 0.16.0

- Bump api image to `8x.6.0`

## 0.15.0

- Bump api image to `8x.5.0`

## 0.14.0

- Bump image to `8x.4.1`
- Added `app.elasticSearchHost` for use in queue pod

## 0.13.0

- Use image 8x.4.0

## 0.12.0

- Get GCS bucket name from configmap

## 0.11.0

- Use image 8x.3.0

## 0.10.0
- Use k8s secrets for api app key and jwt secret

## 0.9.0
- Add SMTP env vars to api chart
- DRY SMTP Env Vars

## 0.8.0

- Start creating and using MW 1.36 wiki dbs by default
- Switch to using standard `image.tag` value format

## 0.7.0

- Updated image used
- Removed default `app.name`.
- Added `wbstack.uiurl` value.

## 0.6.0

- Add optional `app.mail.mailgunendpoint`

## 0.5.0

- Update application image to `8x.1.8` https://github.com/wbstack/api/blob/8x.1.8/CHANGELOG.md#8x18---18-october-2021
- Add `wbstack.subdomainSuffix` value

## 0.4.0

- Optionally use secret for recaptcha details

## 0.3.0

- Optionally use a k8s secret instead of a plaintext value for the mailgun secret

## 0.2.0

- Switch docker file to PHP 7.4 and Laravel 7.x
- Change var name from `app.mail.driver` to `app.mail.mailer`
- Set `MAIL_MAILER` env var instead of `MAIL_DRIVER`

## 0.1.0

- First development version.
