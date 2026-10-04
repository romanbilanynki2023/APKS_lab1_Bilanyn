---
description: Create or reconcile the minimal Rust/Cargo hello package and BasicAddition unit test.
---

# /create-project

## Preconditions

- Run from the repository root after `/git-init` (or confirm this is already a
  Git work tree).
- Rust and Cargo are installed.
- Inspect existing target files and working-tree changes before editing.

## Actions

1. Apply `.github/skills/project-scaffold/SKILL.md`.
2. Create or reconcile the minimal root Cargo package named `hello`, its
   `hello` binary, the library `add` function in `src`, and the unit test
   exactly named `BasicAddition`.
3. Generate or update `Cargo.lock` using Cargo without dropping existing
   dependency choices. Do not add dependencies.
4. Create or reconcile `.gitignore` so it contains `target/` and `build/`,
   preserving all existing ignore rules.
5. Preserve compliant files on repeat runs and never replace unrelated
   user-authored content.
6. Verify the package with the commands below and report changed files.

## Expected files

- `Cargo.toml`
- `Cargo.lock`
- `src/main.rs`
- `src/lib.rs`
- `.gitignore`

## Verification commands

- `cargo metadata --no-deps --format-version 1 --locked`
- `cargo test --locked`

## Error message

On conflict or failed verification, stop and report:
`/create-project failed: <path, command, and error>. Existing files were preserved where safe.`
Do not delete or reset files to force a successful run.
