if [[ "$(domainname -f)" =~ ncrc.gov ]]
then
    __conda_base='/usw/conda/miniforge'
else
    __conda_base='/app/conda/miniforge'
fi

__conda_setup="$('$__conda_basebin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$__conda_base/etc/profile.d/conda.sh" ]; then
        . "$__conda_base/etc/profile.d/conda.sh"
    else
        export PATH="$__conda_base/bin:$PATH"
    fi
fi
unset __conda_setup
unset __conda_base

## If desired, I can set aliases and other settings here.

