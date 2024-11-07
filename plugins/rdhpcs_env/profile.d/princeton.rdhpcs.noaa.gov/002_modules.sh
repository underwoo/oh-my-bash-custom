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
    unset shell
  else
    unset MODULESHOME
  fi
fi
