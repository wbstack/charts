# wbstack mediawiki

## Settings
### mw.settings.allowedProxyCidr 
Sets `$wgCdnServersNoPurge` in mediawiki.

In order to see which IP ranges is used for a GKE cluster you can run the following command:
```
kubectl get ds kube-proxy -n kube-system -o=jsonpath="{.spec.template.spec.containers[0].command}" | grep -Po '\-\-cluster\-cidr=[^ ]*' | cut -d'=' -f2 | tr -d '"]'
```

## Changelog

- 0.10.6: Added `mw.settings.allowedProxyCidr` to set $wgCdnServersNoPurge
- 0.10.5: New MW release with updated CirrusSearch sharding config, we missed one index.
- 0.10.4: New MW release with CirrusSearch sharding config
- 0.10.3: Bump version number to trigger new chart release
- 0.10.2: Bump MW image to 1.37-7.4-20220429-fp-beta-0 including search index no pages fix
- 0.10.1: T301141: Hardcode wikibase concept-uri to HTTPS
- 0.10.0: Added support for SMTP credentials through secrets
- 0.9.0: Bump MW image to 1.37-7.4-20220131-fp-beta-0 including no readonly for cli
- 0.8.0: Bump MW image to 1.37-7.4-20220126-fp-beta-0 including ES migration api
- 0.7.5: Bump MW image to 1.37-7.4-20220118-fp-beta-0 including readonly mode
- 0.7.4: Bump MW image to 1.37-7.4-20220105-fp-beta-0 including updated skins and extensions
- 0.7.3: Bump MW image to 1.37-7.4-20211217-fp-beta-0 including 1.37.1 security release of MW core
- 0.7.2: Fix for still using `mw.mailgun.domain` in template
- 0.7.1: Decoupled email domain setting from mailgun values
- 0.7.0: First 1.37 workin beta image with federated properties v2 (1.37-7.4-20211203-fp-beta-1)
- 0.6.0: Replaced NodePort with ClusterIP
- 0.5.2: Fix for `mw.smtp.auth` setting usage in mediawiki
- 0.5.0: Added `mw.smtp` settings and a toggle for the mw mailgun extension
- 0.4.1: Bumped the MediaWiki image version to contain a backported fix for a SFS extension issue
- 0.4.0: Update to MW 1.36 & use `image.tag` standard value
- 0.3.0: Added `mw.settings.logToStdErr`
- 0.2.0: Bumped MediaWiki application version to updated 1.35, including new Mailgun code, and required `mw.mailgun.endpoint`.
- 0.1.2: Added `mw.recaptcha.sitekeySecretName` and `mw.recaptcha.sitekeySecretKey`.
- 0.1.1: Altered default values for `mw.recaptcha.sitekey` and `mw.recaptcha.secretkey` to empty strings.
- 0.1.0: Initial tag
