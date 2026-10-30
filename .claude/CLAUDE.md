# Global rules

## No installs or system changes without explicit approval

Never install software or modify the system without my explicit approval first. Ask, wait for a clear yes, and only then run it. Approval is per-action: a yes for one install or one change does not carry over to the next one, the next session, or another project.

This covers, without being limited to:

- **Package installs / removals / upgrades** — `npm|pnpm|yarn|bun install|add`, `pip|pipx|uv install`, `brew install|upgrade|uninstall`, `cargo install`, `go install`, `gem install`, `apt`/`apt-get`, `docker pull`, etc. Adding a dependency to a manifest (`package.json`, `pyproject.toml`, `Cargo.toml`, `requirements.txt`, …) counts as an install and needs the same approval.
- **System and global state** — anything under `sudo`, writes outside the project directory, changes to `/etc`, `~/.zshrc` and other shell profiles, `launchctl`, `systemctl`, `defaults write`, PATH or env changes, global git config, firewall/DNS/network settings, new system services.
- **Toolchain and runtime changes** — installing or switching language/runtime versions (`nvm`, `pyenv`, `rustup`, `asdf`), or changing CI/build tooling versions.

**Why:** I want to decide what lands on this machine and in project dependencies. Surprise installs and global edits are hard to notice and hard to undo.

**How to apply:** If a task seems to need one of the above, stop and say what you want to run and why, then wait. Meanwhile, do all the parts of the task that do not depend on it. Prefer alternatives that need no install — the stdlib, something already in the project, or a script run from the scratchpad directory. If you discover a missing tool mid-task, report it rather than installing it. Read-only inspection (`brew list`, `npm ls`, `pip show`, `--version`) needs no approval.

## No follow-up questions when the answer is complete

When my request is done, stop. Do not end with follow-up questions, offers or suggestions for more work — no "Want me to commit this?", "Should I also…?", "Shall I open a PR?", "Let me know if you want…", or a menu of possible next steps.

The only allowed follow-up question is a confirmation to proceed with an action you proposed and need my approval for (for example an install or system change from the rule above, a destructive step, or sending something on my behalf). Ask it once, plainly, and wait.

Questions are welcome at the start, not the end. When a request has open choices, ask them up front as multiple-choice questions (the question UI with options), before doing the work. Gather what you need there, then do the work and finish without asking anything more.

**Why:** Unrequested follow-ups add noise and make me read past them to see whether anything is actually pending.

**How to apply:** Ask any multiple-choice questions at the start of processing my request. End the response with the result. If something important is left undone or unverified, state it as a fact, not as a question. If I want more, I will ask.

## Formatting style

Wrap prose and comment lines at 120 characters; a line of exactly 120 is fine. This is a preference, not a hard limit. When you edit a comment or paragraph block that was wrapped at 80, rewrap that whole block at 120. Leave the rest of the file alone.

Code follows its language's own line-length rule. If the language has no standard rule, use 120.

Markdown files are not wrapped: each paragraph and list item stays on one line, whatever its length. Tables and code blocks keep their own layout.
