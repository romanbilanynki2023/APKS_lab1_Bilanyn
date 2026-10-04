---
description: Orchestrate repository initialization, Rust project generation, local CI scripts, workflow setup, and read-only checks.
---

# init-agent

## Preconditions

- Run from the intended repository root in VS Code Agent mode.
- Git, Rust, and Cargo are available.
- Read the individual prompts before running them.
- Inspect existing files and the working-tree state; preserve unrelated work.

## Actions

Run these prompts in this exact order, completing and verifying each before
starting the next:

1. `/git-init`
2. `/create-project`
3. `/create-build`
4. `/create-actions`
5. `/check`

Stop immediately if any prompt reports an error, a prerequisite is missing, or
a required verification fails. Do not continue to later stages or turn
`/check` into a repair step. Each stage must remain idempotent and preserve
existing user content.

## Expected files

- Git metadata only if the repository was not initialized already.
- `Cargo.toml`, `Cargo.lock`, `src/main.rs`, and `src/lib.rs`.
- `ci.sh` and `ci.bat`.
- `.github/workflows/ci.yml`.
- `.gitignore` containing `target/` and `build/` (created/reconciled as part of
  project setup where appropriate).

## Verification commands

Each stage runs its own checks. Final read-only verification is performed by
`/check`, including Cargo metadata and, where safe and available, tests with
an external target directory.

## Error message

On the first failure, stop and report:
`/init stopped at <prompt>: <command or requirement and error>. Later prompts were not run.`
Do not retry a failed stage in a way that overwrites files, and do not claim
overall success unless `/check` passes.
