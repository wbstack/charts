# wbstack api

## Settings

`app.recaptcha.enabled` defaults to `true`. Set it to `false` to pass
`RECAPTCHA_ENABLED=false` to the web app and omit its reCAPTCHA secret reference
and minimum-score setting. This requires an API image that supports the opt-out;
the API only bypasses verification when `app.env` is also `local`.

## Changelog

- 0.12.0: Get GCS bucket name from configmap
- 0.11.0: Update api image tag
- 0.10.2: Change service from `NodePort` to `ClusterIP`
- 0.10.1: Change image pullPolicy values to `IfNotPresent`
