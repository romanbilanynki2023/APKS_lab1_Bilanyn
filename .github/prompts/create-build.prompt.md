---
description: Create or reconcile cross-platform local build and test scripts.
---

# /create-build

## Preconditions

- The Rust package and `Cargo.lock` exist and are valid.
- Inspect existing scripts and working-tree changes before editing.
- Cargo is installed for validation.

## Actions

1. Apply `.github/skills/build-and-test/SKILL.md`.
2. Create or reconcile `ci.sh` and `ci.bat`.
3. Both scripts must build release mode and run tests using Cargo, fail when a
   command fails, and respect `CARGO_TARGET_DIR` if the caller supplied it.
4. Preserve compliant scripts; do not append repeated command blocks.
5. Run the applicable syntax check and host-platform script check. Report
   platform checks that could not be run.

## Expected files

- `ci.sh`
- `ci.bat`

## Verification commands

- POSIX: `sh -n ci.sh` and `./ci.sh`
- Windows: `cmd.exe /c ci.bat`

## Error message

On a failed command or unavailable tool, stop and report:
`/create-build failed: <command and error>. No test or build failure was suppressed.`
Do not skip a failing build/test command or claim an untested platform passed.
