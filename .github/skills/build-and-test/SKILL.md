---
name: build-and-test
description: Provide reliable cross-platform local scripts and verify the Rust package with Cargo.
---

# Build and test

## Purpose

Create local CI scripts that build the Rust package and run its tests, and
verify the same Cargo commands directly.

## When to apply

Apply when `/create-build` is requested or when either local CI script is
missing or noncompliant. Apply the checks when project code or build scripts
change. `/check` may use these commands with an external Cargo target directory
to avoid writing build output into the repository.

## Inputs

- A valid root `Cargo.toml` and `Cargo.lock`.
- The available host shell and installed Rust/Cargo toolchain.
- Existing `ci.sh` and `ci.bat`, if present.

## Output files

- `ci.sh`: use a POSIX shell with fail-fast behavior; run
  `cargo build --release --locked` and `cargo test --locked`.
- `ci.bat`: run the same commands on Windows and stop with a nonzero exit code
  as soon as either command fails.

Both scripts must work from the repository root or resolve and enter their
own repository root first. Preserve an externally supplied
`CARGO_TARGET_DIR`.

## Checks

- On POSIX, run `sh -n ci.sh` and `./ci.sh`.
- On Windows, run `ci.bat` in `cmd.exe`.
- Confirm both build and test commands run and that errors propagate as a
  nonzero script exit status.
- Confirm the scripts do not swallow Cargo output or mask failures.

## Example input

> Add `ci.sh` and `ci.bat` so each builds the release binary and runs the
> Cargo test suite, failing immediately if either command fails.

## Typical error and response

**Error:** Cargo is unavailable, a command fails, or the current shell cannot
execute the script.

**Response:** Report the exact failing command and its output. Check the
toolchain and host shell prerequisites; do not turn failure into success,
skip tests, or silently replace the required command. Do not claim that a
platform-specific script passed unless it was actually run on that platform.
