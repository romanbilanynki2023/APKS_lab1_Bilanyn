---
description: Initialize a local Git repository only when the workspace is not already one.
---

# /git-init

## Preconditions

- The current workspace is the intended repository root.
- Git is installed and available.
- Inspect the current directory and Git status before taking action.

## Actions

1. Determine whether the current directory is already inside a Git work tree.
2. If it is, leave Git configuration, branches, remotes, and history unchanged
   and report that the repository is already initialized.
3. If it is not, run `git init` in the current workspace.
4. Verify with `git rev-parse --show-toplevel` and report the resulting root.
5. Do not create a commit, switch or create a branch, add a remote, or push.

This command is idempotent: a repeat run on an initialized repository makes no
changes.

## Expected files

- No project files are created by this command.
- Git's own `.git` metadata is created only when initialization is necessary.

## Verification commands

- `git rev-parse --is-inside-work-tree`
- `git rev-parse --show-toplevel`

## Error message

If Git is unavailable or initialization/verification fails, stop and report:
`/git-init failed: <command and error>. No commit, branch change, or push was performed.`
Do not attempt to install Git or make unrelated repository changes.
