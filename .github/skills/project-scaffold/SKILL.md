---
name: project-scaffold
description: Create or reconcile the minimal Rust/Cargo hello package and its addition unit test.
---

# Project scaffold

## Purpose

Create the root Cargo package, a `hello` binary, an `add` library function,
and the `BasicAddition` unit test without disturbing unrelated work.

## When to apply

Apply when `/create-project` is requested or when the project scaffold is
missing or does not meet the stated Rust requirements. Do not apply this skill
to `/check`.

## Inputs

- Repository root and current working-tree state.
- Existing `Cargo.toml`, `Cargo.lock`, and files under `src/`, if present.
- Required package/binary name `hello` and test name `BasicAddition`.

If any of these target files contain unrelated work, preserve it and reconcile
only the required portions.

## Output files

- `Cargo.toml`: a minimal package named `hello`.
- `Cargo.lock`: a lockfile generated with Cargo, committed as a project file.
- `src/main.rs`: entry point for the `hello` binary.
- `src/lib.rs`: public `add` function and its unit test.
- `.gitignore`: include `target/` and `build/`, preserving any existing ignore
  rules.

The test must be discoverable by `cargo test` and have the exact test name
`BasicAddition`. If Rust naming conventions require a lint allowance for that
name, scope the allowance to the test rather than disabling the lint globally.
Do not add external dependencies.

## Checks

- Confirm the package and binary target names using `cargo metadata --no-deps
  --format-version 1 --locked`.
- Run `cargo test --locked`.
- Confirm the test output includes `BasicAddition` and passes.
- Inspect the final diff to ensure only relevant scaffold files changed.

## Example input

> Create the minimal root Rust package for this lab: a `hello` binary, an
> `add` function in the library, and a unit test named `BasicAddition`.

## Typical error and response

**Error:** Cargo reports a manifest/lockfile conflict or a pre-existing target
file has incompatible content.

**Response:** Read the existing files and reconcile only the required package
or test definitions. Regenerate `Cargo.lock` with Cargo only if doing so does
not discard unrelated dependency choices. If safe reconciliation is unclear,
stop and report the conflicting paths and error; do not delete or replace
files.
