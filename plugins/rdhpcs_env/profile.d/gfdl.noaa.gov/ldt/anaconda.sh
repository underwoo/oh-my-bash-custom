# Functions that can be used to control if the Anaconda environments are
# to be used

# use anaconda 2 or 3.  Echo message if one of the two are already active
function use_anaconda {
  local anaconda2or3=$1
  local anacondaRootDir=/local2/home/Anaconda
  local anacondaVersion=5.2.0

  if [[ ! ${anaconda2or3} =~ "[23]" ]]
  then
    echo "Unknown Anaconda python version specified.  Needs to be \"2\" or \"3\"" 1>&2
  else
    # Check if anaconda is already in PATH
    if [[ ":${PATH}:" =~ ":${anacondaRootDir}/anaconda[23]/${anacondaVersion}/bin:" ]]
    then
      echo "Anaconda already in environment.  No change." 1>&2
    else
      PATH=${anacondaRootDir}/anaconda${anaconda2or3}/${anacondaVersion}/bin${PATH:+:}${PATH}; export PATH
      local mymanpath=$(manpath 2>&/dev/null)
      MANPATH=${anacondaRootDir}/anaconda${anaconda2or3}/${anacondaVersion}/share/man${mymanpath:+:}${mymanpath}; export MANPATH
    fi
  fi
}

function unuse_anaconda {
  local anacondaRootDir=/local2/home/Anaconda
  local anacondaVersion=5.2.0

  PATH=$(echo "${PATH}:" | sed -e 's@'"${anacondaRootDir}"'/anaconda[23]/'"${anacondaVersion}"'/bin:@@g' | sed -e 's/:\+$//'); export PATH
  MANPATH=$(echo "${MANPATH}:" | sed -e 's@'"${anacondaRootDir}"'/anaconda[23]/'"${anacondaVersion}"'/share/man:@@g' | sed -e 's/:\+$//'); export MANPATH
}

function switch_anaconda {
  local anacondaRootDir=/local2/home/Anaconda
  local anacondaVersion=5.2.0

  # Check if Anaconda already in PATH
  local anacondaLoaded=$(echo ":${PATH}:" | sed -ne 's@.*:'"${anacondaRootDir}"'/anaconda\([23]\)/'"${anacondaVersion}"'/bin:.*@\1@p')
  if [ "${anacondaLoaded:+true}" = "true" ]
  then
    unuse_anaconda
    case $anacondaLoaded in
      2)
        use_anaconda 3
        ;;
      3)
        use_anaconda 2
        ;;
      *)
        echo "Error while switch Anaconda version.  Check environment." 1>&2
        ;;
    esac
  else
    echo "Anaconda not loaded." 1>&2
  fi
}
