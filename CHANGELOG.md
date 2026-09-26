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

### Fixed

- **The sync pull request no longer repeats a changelog heading.** The
  workflow opened the release's section with its own `### Changed`, so
  when the unreleased entries already had one, the section carried two
  and markdownlint failed. It now puts the lockstep entry first in the
  existing Changed list, or creates one in Keep a Changelog's order.

## [0.0.7] — 2026-09-26

### Changed

- **In lockstep with scout 0.0.7.** The action and the GitLab template pin `ghcr.io/sebastienrousseau/scout@sha256:43034d2a0f36b28e3d227335fb19a59e09cd556ee3075f9bcadb5dee9995c32b`, the multi-arch image scout's release published for 0.0.7. Opened by the sync workflow on the release's dispatch; scout's own changelog says what changed in the diagnostic.
- **A manual, an architecture page and a template README.** The docs
  are built with MkDocs from scout's hash-locked requirements, strictly on
  every pull request, and deployed to GitHub Pages from main.
  `ARCHITECTURE.md` explains the one decision, the image by digest, the
  flow of a run, and how the pin follows scout's releases. The README
  follows the portfolio template, which `scripts/readme-check.sh` now
  enforces in CI.
- **The sync pull request can start its own checks.** A pull request
  opened with `GITHUB_TOKEN` triggers no workflows, so every sync pull
  request needed a manual close and reopen before CI ran. With a
  `SYNC_TOKEN` secret, a fine-grained token with `pull-requests: write` on
  this repository, the workflow opens the pull request with it and the
  checks start. The commits are still made with `GITHUB_TOKEN`, so they
  stay GitHub-signed and exempt from the DCO check as the bot's. Without
  the secret nothing changes, and the run log says to close and reopen.

## [0.0.6] — 2026-09-25

### Changed

- **In lockstep with scout 0.0.6.** The action and the GitLab template pin `ghcr.io/sebastienrousseau/scout@sha256:d7b69bd815514e1dd86bb06b6eeffaf4b66d3b9e8e89ea4edb84ffa5c1b81b39`, the multi-arch image scout's release published for 0.0.6. Opened by the sync workflow on the release's dispatch; scout's own changelog says what changed in the diagnostic.

## [0.0.5] — 2026-09-24

### Changed

- **In lockstep with scout 0.0.5.** The action and the GitLab template pin `ghcr.io/sebastienrousseau/scout@sha256:f629728812662aa85c3b296bf1b6a9530d90b032ed802ac607fb6b443314f873`, the multi-arch image scout's release published for 0.0.5. Opened by the sync workflow on the release's dispatch; scout's own changelog says what changed in the diagnostic.

## [0.0.4] — 2026-09-24

### Changed

- **In lockstep with scout 0.0.4.** The action and the GitLab template pin `ghcr.io/sebastienrousseau/scout@sha256:95d1ae4601c5d12e51c98fb120e79c36ecb104126698a81150135f7256f473f0`, the multi-arch image scout's release published for 0.0.4. Opened by the sync workflow on the release's dispatch; scout's own changelog says what changed in the diagnostic.

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

[Unreleased]: https://github.com/sebastienrousseau/scout-action/compare/v0.0.7...HEAD
[0.0.7]: https://github.com/sebastienrousseau/scout-action/releases/tag/v0.0.7
[0.0.6]: https://github.com/sebastienrousseau/scout-action/releases/tag/v0.0.6
[0.0.5]: https://github.com/sebastienrousseau/scout-action/releases/tag/v0.0.5
[0.0.4]: https://github.com/sebastienrousseau/scout-action/releases/tag/v0.0.4
[0.0.3]: https://github.com/sebastienrousseau/scout-action/releases/tag/v0.0.3
