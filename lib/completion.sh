#! bash oh-my-bash.module

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
if [[ "$CASE_SENSITIVE" == "true" ]]; then
  bind "set completion-ignore-case on"
fi

# Treat hyphens and underscores as equivalent
if [[ "$HYPHEN_INSENSITIVE" == "true" ]]; then
  bind "set completion-map-case on"
fi

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"