# Oh-My-Bash Custom

This repository contains my oh-my-bash custom directory.

To use these items, you can either clone this repository
over the `~/.oh-my-bash/custom` directory, or clone this
to any writable location, and then set the `OSH_CUSTOM`
variable in your `~/.bashrc`.

To enable the items in this custom repository, add the
items to the `~/.bashrc` as you would any of the oh-my-bash
extensions.

## Available Extensions

### Lib

These `custom/lib`s are mainly to correct problems in the upstream
oh-my-bash until the upstream accepts the updates.

bourne-shell.sh
: Correct setting "alert" alias if `notify-send` does not exist

directories.sh
: Remove all directories aliases, as some are only
usable in zsh (e.g. `cd -<#>`).

misc.sh
: remove `_` and `please` as aliases to `sudo`.  Add check for `ack`.

shopt.sh
: Add `ENABLE_CORRECTION` variable to work as listed in `templates/bashrc.osh-template`.

theme-and-appearance.sh
: Add rewrite of oh-my-zsh's `LS_COLOR` logic, and allow user to set `DISABLE_LS_COLOR=true`
to disable colors.
