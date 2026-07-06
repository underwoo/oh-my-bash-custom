# Oh-My-Bash Custom

This repository contains custom extensions for Oh-My-Bash, synced across
multiple systems via git.

## Installation

Clone this repository over the `~/.oh-my-bash/custom` directory:

```bash
cd ~/.oh-my-bash
rm -rf custom
git clone git@github.com:underwoo/oh-my-bash-custom.git custom
```

Or clone to any location and set the `OSH_CUSTOM` variable in `~/.bashrc`:

```bash
git clone git@github.com:underwoo/oh-my-bash-custom.git ~/oh-my-bash-custom
export OSH_CUSTOM="$HOME/oh-my-bash-custom"
```

## Usage

Enable these extensions in `~/.bashrc` as you would any Oh-My-Bash plugin or
completion:

```bash
plugins=(... slurm iterm-shell-integration)
completions=(... bash slurm)
```

Then source the standalone scripts if needed:

```bash
source "$OSH_CUSTOM/no_shelltmout.sh"
source "$OSH_CUSTOM/no_ignoreeof.sh"
```

## Available Extensions

### Completions

#### `completions/bash.completion.sh`

Standard bash-completion library (v2.7) from the
[bash-completion project](https://github.com/scop/bash-completion). Included
for portability to systems that don't have the bash-completion package
installed system-wide.

**When to use:** Most systems already have bash-completion in
`/usr/share/bash-completion/`. This is provided for RDHPCS systems or minimal
environments where it may be missing.

#### `completions/slurm.completion.sh`

Official Slurm bash completion script from
[SchedMD](https://github.com/SchedMD/slurm). Provides comprehensive
tab-completion for all Slurm commands (`sbatch`, `squeue`, `scancel`, `sinfo`,
etc.) with intelligent context-aware suggestions for:

- Job IDs, node names, partition names, account names, QOS names
- Command flags and options
- Job states, signals, resource types (GRES)
- Comma-separated lists with automatic hostlist compression

**Updated:** 2026-07-06 (5,363 lines, latest from upstream)

### Plugins

#### `plugins/slurm/`

Custom Slurm helper functions for HPC workflow convenience:

- **`sinfo-nodes`** - Enhanced `sinfo` wrapper that displays total node counts
  with auto-formatted columns and federation support
- **`job_nodes`** - Lists the nodes a running job is using (queries `sacct`
  JSON output)

**Usage:**

```bash
sinfo-nodes                    # Show all partitions with node counts
sinfo-nodes -p compute         # Filter by partition
job_nodes 12345                # List nodes for job ID 12345
```

#### `plugins/iterm-shell-integration/`

Official [iTerm2 shell integration](https://iterm2.com/documentation-shell-integration.html)
for macOS. Enables iTerm2 features:

- Current directory tracking
- Remote host tracking (shows user@hostname in iTerm2 window title)
- Command status indicators (success/failure marks)
- Shell prompt marks (enables "Edit > Marks > Jump to Previous Mark")
- User-defined variables support

Includes [bash-preexec v0.4.1](https://github.com/rcaloras/bash-preexec) for
preexec/precmd hooks.

**ShellIntegrationVersion:** 18 (current as of 2026-07-06)

**When to use:** Only on macOS when using iTerm2. Has no effect on Linux or
other terminals.

### Standalone Scripts

#### `no_shelltmout.sh`

Disables the `TMOUT` auto-logout timer by unsetting the variable.

**Purpose:** Some RDHPCS systems or enterprise environments set `TMOUT` in
system-wide profiles (e.g., `/etc/profile.d/`), causing idle shells to exit
after a timeout period (commonly 15 minutes). This script overrides that
behavior.

**Usage:** Source this script after Oh-My-Bash loads to ensure your shell
sessions don't time out while you're away from the terminal.

#### `no_ignoreeof.sh`

Unsets the `ignoreeof` shell option to ensure Ctrl-D exits the shell
immediately.

**Purpose:** Defensive override for systems that may set `set -o ignoreeof` or
`IGNOREEOF=N` in system configs, which requires multiple Ctrl-D presses to
exit. This restores the standard single-Ctrl-D-to-exit behavior.

**Usage:** Source this script if you encounter systems where Ctrl-D doesn't
exit the shell as expected.

## Maintenance Notes

- **bash.completion.sh** and **slurm.completion.sh** are sourced from upstream
  projects and should be updated periodically
- **iterm-shell-integration** is sourced from iTerm2's official distribution
- Custom **lib/** overrides have been removed as of 2026-07-06 (fixes were
  accepted upstream into Oh-My-Bash)
- Example files (`example.sh`, `example.aliases.sh`, etc.) are excluded from
  the repository via `.gitignore`

## System Compatibility

- **Completions:** Work on all bash 4.1+ systems
- **Slurm plugin:** Requires Slurm installation and `sacct` with JSON support
- **iTerm2 integration:** macOS only, requires iTerm2 terminal
- **Standalone scripts:** POSIX-compatible, work on all bash systems

## Repository

GitHub: [underwoo/oh-my-bash-custom](https://github.com/underwoo/oh-my-bash-custom)
