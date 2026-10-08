# Upstream

| | |
| --- | --- |
| Project | secDevLabs (Globo.com) |
| Repository | https://github.com/globocom/secDevLabs |
| App | `owasp-top10-2021-apps/a1/camplake-api` |
| Version | master (secDevLabs has no releases) |
| Commit | 10be438496e928c66567749f0aaf0bb976052bc9 |
| Licence | BSD-3-Clause |

The app folder [`owasp-top10-2021-apps/a1/camplake-api`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a1/camplake-api) of that commit is vendored unchanged, without its Git history,
split so that each part sits in the build folder of the machine that uses it:

| Upstream path (in the app folder) | Here |
| --- | --- |
| `deployments/mongo-init.js, deployments/mongo.Dockerfile` | `build/mongodb/app/deployments/` |
| `everything else` | `build/api/app/` |

Each `build/<machine>/Dockerfile` says in its header comment how it differs from upstream:

- `build/api/`: upstream's `deployments/api.Dockerfile` with the environment of upstream's compose file baked in (`ENV`), the database user and password of upstream's committed `mongo-init.js` (upstream's `make install` regenerates both at random), a compile at build time so `go run` starts offline, and the compose command as `CMD`. The compose file's unused `/var/lib/docker` volume is left out.
- `build/mongodb/`: upstream's `deployments/mongo.Dockerfile` (`mongo:4.0.3` with `mongo-init.js`).

To update, replace the vendored folders with a newer secDevLabs commit, then change this file.
