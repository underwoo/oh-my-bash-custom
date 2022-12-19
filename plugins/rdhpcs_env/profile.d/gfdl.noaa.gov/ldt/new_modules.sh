# Setup the new modules environment

# only modify the modules environment if loaded
if [ ! -z ${MODULESHOME+x} ]
then
  # unload current modules
  module purge
  # Add the new modulefiles prior to the old
  # this may cause problems, so I need to be careful
  module use /app/spack/default/modulefiles
fi

