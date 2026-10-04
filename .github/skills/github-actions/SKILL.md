---
name: github-actions
description: Create and statically verify the single-job cross-platform GitHub Actions workflow.
---

# GitHub Actions

## Purpose

Define the CI workflow that checks out the repository and invokes the local
build-and-test script on Linux, Windows, and macOS.

## When to apply

Apply when `/create-actions` is requested or when `.github/workflows/ci.yml`
is missing or does not meet the lab specification.

## Inputs

- Existing `ci.sh` and `ci.bat` with the same build/test contract.
- Required event branches: `develop` and `master`.
- Required runner matrix: `ubuntu-latest`, `windows-latest`, and
  `macos-latest`.

## Output files

- `.github/workflows/ci.yml`: one workflow with exactly one job, one
  three-platform OS matrix, a checkout step, and a step invoking the
  corresponding local script. Trigger on `push` and `pull_request` for
  `develop` and `master`.

The workflow must not duplicate build or test commands: the job delegates
those operations to `ci.sh` or `ci.bat`. Do not add deployment, secrets,
permissions changes, extra jobs, or unrelated triggers.

## Checks

- Inspect the YAML structure and confirm there is exactly one job.
- Confirm all three runner labels and both branch filters are present for both
  events.
- Confirm Windows invokes `ci.bat` and Linux/macOS invoke `ci.sh`.
- Confirm the only project build/test actions are the local script calls.
- If a YAML parser or workflow linter is already available, run it; do not add
  dependencies solely for this check.

## Example input

> Add the CI workflow with a single job and a Linux/Windows/macOS matrix. On
> pushes and pull requests to `develop` or `master`, call the existing local
> CI script for that runner.

## Typical error and response

**Error:** YAML parsing fails, the workflow has multiple jobs, or a matrix
entry invokes the wrong script.

**Response:** Correct the relevant workflow structure, then re-check the
complete file against every requirement. Do not compensate by adding duplicate
jobs or moving build commands into the workflow.
