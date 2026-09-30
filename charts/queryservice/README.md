# wbstack queryservice

## Settings

Existing memory and probe defaults are preserved unless overridden.

| Value | Default | Description |
| --- | --- | --- |
| `app.maxRam` | `2g` | JVM `-XX:MaxRAM`; not a total process-memory limit. |
| `app.maxDirectMemorySize` | `""` | Optional JVM `-XX:MaxDirectMemorySize` limit. |
| `startupProbe` | `{}` | Optional Kubernetes startup probe, applied only when `useProbes` is enabled. |
| `probeTimeoutSeconds` | `1` | Timeout for the HTTP liveness and readiness probes. |

## Changelog

- 0.2.4: Make JVM memory limits and startup/probe settings configurable while preserving existing defaults.
- 0.2.0: Switch to ingress API version to GA v1 from v1beta1
- 0.1.3: Change service from `NodePort` to `ClusterIP`
- 0.1.2: Change image pullPolicy values to `IfNotPresent`
- 0.1.1: Added `useProbes` value (Backwards compatible default to true)
- 0.1.0: Initial tag
