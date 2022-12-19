# On Mac laptop, add the brew path
if [ -e /Users/${USER}/opt/homebrew/bin/brew ]
then
  eval $(/Users/${USER}/opt/homebrew/bin/brew shellenv)
fi

# Other useful environment variables
export HOMEBREW_CASK_OPTS="--appdir=/Users/Seth.Underwood/Applications"
export HOMEBREW_NO_ANALYTICS=1
