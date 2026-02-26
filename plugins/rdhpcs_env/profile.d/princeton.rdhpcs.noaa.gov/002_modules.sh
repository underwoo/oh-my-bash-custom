# Setup the LMOD Environment Modules

# Clean up the some of the modules environment variables to re-initialize
# modules.  This is needed since the default is still the standard
# environment modules
unset MODULE_VERSION
unset MODULE_VERSION_STACK

# MODULESHOME to point to the LMOD installation
MODULESHOME=/usr/local/lmod/lmod

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
    LMOD_ADMIN_FILE="$(dirname $MODULESHOME)/etc/admin.list"
    LMOD_PACKAGE_PATH="$(dirname $MODULESHOME)/etc"
    export MODULESHOME
    export LMOD_ADMIN_FILE
    export LMOD_PACKAGE_PATH
    unset shell
  else
    unset MODULESHOME
  fi
fi
