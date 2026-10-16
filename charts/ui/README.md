# wbstack ui

## Settings

`ui.recaptchaEnabled` defaults to `true`. Set it to `false` to pass
`RECAPTCHA_ENABLED=0` to the UI and omit its reCAPTCHA site-key secret reference.
This requires a UI image that supports the opt-out. Configure the API opt-out
separately so it does not require the token that the UI no longer sends.
