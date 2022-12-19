# Setup the Spack environment

# Allow spack to load modules:
if [ ! -z ${MODULESHOME+x} ]
then
   pathmunge ${MODULESHOME}/bin after
fi
