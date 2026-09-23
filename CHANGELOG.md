<!-- SPDX-FileCopyrightText: 2026 Sebastien Rousseau <sebastian.rousseau@gmail.com> -->
<!-- SPDX-License-Identifier: Apache-2.0 -->

# Changelog

All notable changes to scout-action are documented here. The format
follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and
versions are [Semantic Versioning](https://semver.org/) shaped.

**This repository carries scout's version.** It is in lockstep with
[scout](https://github.com/sebastienrousseau/scout): every scout release
is a release here, pinning that release's image by digest, and a release
here with nothing else in it is the version rule working. The sync
workflow opens the section on scout's release dispatch; scout's own
changelog says what changed in the diagnostic.

## [Unreleased]

## [0.0.3] — 2026-09-23

### Added

- **The action.** `sebastienrousseau/scout-action` runs `scout check`
  from the image scout's release pipeline published, pinned by digest,
  so what runs in a workflow is exactly what the release signed. Inputs
  map one to one onto flags `scout check` already has: `endpoint`,
  `token` (through the environment, never an argument), `policy`,
  `args`, `report-dir`; `fail-on` decides which exit code fails the job;
  `summary` puts the Markdown report on the run page, `attest` writes
  the in-toto statement beside the report, `upload` keeps the evidence
  as an artifact on success and on failure. Outputs carry the exit code,
  the score and grade, and the paths of the JSON report, the SARIF file
  and the attestation.

- **The GitLab template**, `templates/scout.gitlab-ci.yml`, pinning the
  same image, with the SARIF file handed to GitLab as a SAST report.

- **Lockstep machinery.** `scripts/lockstep.sh` refuses a version that is
  not scout's latest release; `scripts/verify-digest.sh` refuses a digest
  that is not the image ghcr.io tags for that version, in the action and
  in the template; the sync workflow moves both on scout's release
  dispatch and opens the pull request.

### Pins

- `ghcr.io/sebastienrousseau/scout@sha256:3eb41af0eebe737513844d81d250f7fdc65d6b39dbc2e18e5715ee481906047b`,
  the multi-arch image of scout 0.0.3. This repository's first version is
  scout's current one: it wraps a release, so it cannot be ahead of one.

[Unreleased]: https://github.com/sebastienrousseau/scout-action/compare/v0.0.3...HEAD
[0.0.3]: https://github.com/sebastienrousseau/scout-action/releases/tag/v0.0.3
