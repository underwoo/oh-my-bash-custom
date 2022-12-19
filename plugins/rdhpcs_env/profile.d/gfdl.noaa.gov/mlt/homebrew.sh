# On Mac laptop, add the brew path
if [ -e /Users/${USER}/opt/homebrew/bin/brew ]
then
  eval $(/Users/${USER}/opt/homebrew/bin/brew shellenv)
fi

# Other useful environment variables
export HOMEBREW_CASK_OPTS="--appdir=/Users/Seth.Underwood/Applications"
export HOMEBREW_NO_ANALYTICS=1

# Enable brew bash completions
#for i in /Users/seth.underwood/opt/homebrew/etc/bash_completion.d/*
#do
#  if [ -r "$i" ]
#  then
#    if [ "${-#*i}" != "$-" ]
#    then
#      . "$i"
#    else
#      . "$i" >/dev/null 2>&1
#    fi
#  fi
#done

