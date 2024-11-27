# wbstack-cloud-clusterisssuers

This chart deploys cert-manager `ClusterIssuer` resources, which represent CAs that are able to generate signed certificates by honoring certificate signing requests. The `ClusterIssuer` resource is almost identical to the `Issuer` resource, however is non-namespaced so it can be used to issue `Certificates` across all namespaces.

https://cert-manager.io/docs/configuration/

## changelog
- 0.2.0: Add self-signed cluster issuer for local environment
- 0.1.0: Initial tag