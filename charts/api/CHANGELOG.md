# api

This chart does not yet follow SemVer.

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
