# SPDX-FileCopyrightText: 2026 Sebastien Rousseau <sebastian.rousseau@gmail.com>
# SPDX-License-Identifier: Apache-2.0

.PHONY: all lint spdx-check lockstep digest family test help

# Every gate CI runs.
all: lint spdx-check digest lockstep family test

# actionlint reads action.yml and every workflow, shellcheck included.
lint:
	actionlint
	shellcheck scripts/*.sh

spdx-check:
	scripts/spdx-check.sh

# The image pinned in action.yml is the image of the version in CHANGELOG.md.
digest:
	scripts/verify-digest.sh

# The version is scout's latest release, exactly.
lockstep:
	scripts/lockstep.sh

# This repository's row in scout's family manifest is true of this tree.
family:
	scripts/family.sh

# Run the pinned image the way the action does, without a server: proves
# the digest pulls and the binary answers.
test:
	docker run --rm "$$(scripts/pinned-image.sh)" version

help:
	@printf '%s\n' "targets: all lint spdx-check digest lockstep family test"
