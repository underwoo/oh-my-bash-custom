# On MacOS, it is possible Visual Studio Code is not in /Applications
# Use `osascript` to get the POSIX path to "Visual Studio Code.app"

if [[ x"$(command -v code)" == "x" ]]
then
    # The code command was not found in PATH, add it
    if [[ $OSTYPE == darwin* ]]
    then
        _code_path=$(osascript -e 'POSIX path of (path to application "Visual Studio Code")')
        # Add Visual Studio Code (code) to the path
        export PATH="${PATH}:${_code_path}/Contents/Resources/app/bin"
        unset _code_path
    fi
fi