---
description: Create or reconcile the single-job cross-platform GitHub Actions CI workflow.
---

# /create-actions

## Preconditions

- `ci.sh` and `ci.bat` exist and implement the required build/test behavior.
- Inspect the existing workflow and working-tree changes before editing.

## Actions

1. Apply `.github/skills/github-actions/SKILL.md`.
2. Create or reconcile `.github/workflows/ci.yml`.
3. Configure `push` and `pull_request` for branches `develop` and `master`.
4. Define exactly one job with an OS matrix containing
   `ubuntu-latest`, `windows-latest`, and `macos-latest`.
5. Check out the repository, then call `ci.bat` on Windows and `ci.sh` on
   Linux/macOS. Do not duplicate build or test commands in YAML.
6. Preserve unrelated workflow content only when it does not violate the
   single-job/required-trigger contract. Do not create duplicate jobs on rerun.

## Expected files

- `.github/workflows/ci.yml`

## Verification commands

- Inspect the workflow for one job, all three OS values, both events and both
  branch names, and the correct script per OS.
- Run an existing YAML parser/workflow linter if available.

## Error message

If prerequisites are missing or the workflow cannot be validated, stop and
report:
`/create-actions failed: <missing prerequisite, path, or validation error>.`
Do not introduce extra jobs or duplicate build/test steps to work around it.
