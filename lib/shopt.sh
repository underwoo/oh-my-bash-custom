#! bash oh-my-bash.module

# Various shell options collected in single file
# taken from bash-sensible and other sources
## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## BETTER DIRECTORY NAVIGATION ##

if [[ "$ENABLE_CORRECTION" == "true" ]]; then
  # Prepend cd to directory names automatically
  shopt -s autocd 2> /dev/null
  # Correct spelling errors during tab-completion
  shopt -s dirspell 2> /dev/null
  # Correct spelling errors in arguments supplied to cd
  shopt -s cdspell 2> /dev/null
fi

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projec
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars
