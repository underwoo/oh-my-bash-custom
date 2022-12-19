# Setup the Environment Modules
#
# NCRC uses a symlink in /opt/cray/pe/modules/default to point
# to the `default` version.
MODULESHOME=/opt/cray/pe/modules/default
# Use 4.1.3.1 for testing.
#MODULESHOME=/opt/cray/pe/modules/4.1.3.1

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
  else
    unset MODULESHOME
  fi
fi

# Add the FMS modulefiles
module use -a /ncrc/home2/fms/local/modulefiles

# For some reason, globus tools are not in the path when in an non-interactive session, this
# swapping corrects the issue.
if [ "${-#*i}" = "$-" ]
then
  module swap globus globus
fi
