---
description: Read-only verification of the generated project and CI requirements.
---

# /check

## Preconditions

- Run from the repository root.
- The generated files are expected to exist.
- Inspect the working-tree status before validation.

## Actions

1. Read the requirements in this prompt and the three relevant skills.
2. Inspect the manifest, Rust sources, scripts, workflow, and `.gitignore`.
3. Verify the required names and behavior: binary `hello`, library function
   `add`, test `BasicAddition`, build-and-test scripts, one CI job with the
   required matrix/triggers, and ignored `target/` and `build/`.
4. Run non-mutating metadata validation with
   `cargo metadata --no-deps --format-version 1 --locked`.
5. If executing the scripts or tests, set `CARGO_TARGET_DIR` to a newly
   allocated directory outside the repository and set Cargo to offline mode
   (for example, `CARGO_NET_OFFLINE=true`). The scripts must use locked Cargo
   commands. Do not create or update repository files, including `Cargo.lock`.
   Preserve the pre-check working-tree state and report any unexpected change;
   never clean it up by deleting files.
6. Report each check as pass, fail, or not run, with evidence.

This command is strictly read-only with respect to the repository. Do not edit,
format, initialize Git, generate a lockfile, or fix issues during `/check`.

## Expected files

- No files are created, edited, or deleted.

## Verification commands

- `git status --short` before and after (when Git is available).
- `cargo metadata --no-deps --format-version 1 --locked`.
- Optional host checks: run `ci.sh` or `ci.bat` with `CARGO_TARGET_DIR` set to
  a new external temporary directory and Cargo offline mode enabled.

## Error message

On a failed requirement or check, report:
`/check failed: <requirement or command> — <observed evidence>. Repository files were not changed by /check.`
Do not repair the failure in this command. Ask the user to run the relevant
creation command.
