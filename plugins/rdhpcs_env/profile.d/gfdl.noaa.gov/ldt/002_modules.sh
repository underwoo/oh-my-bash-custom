# Setup the Environment Modules

# Clean up the some of the modules environment variables to re-initialize
# modules.
unset MODULE_VERSION
unset MODULE_VERSION_STACK

# As GFDL installs the module version in /usr/local/Modules/<version>
# with a symlink `default` pointing to the default version, set
# MODULESHOME to point to the GFDL default module install location
MODULESHOME=/usr/local/Modules/default

# Check if MODULESHOME exists
if [ ! -z ${MODULESHOME+x} ]
then
  if [ -e $MODULESHOME ]
  then
    shell=`/bin/basename \`/bin/ps -p $$ -ocomm=\``
    if [ -f ${MODULESHOME}/init/$shell ]
    then
       . ${MODULESHOME}/init/$shell
    else
      . ${MODULESHOME}/init/sh
    fi
    unset shell
  else
    unset MODULESHOME
  fi
fi
