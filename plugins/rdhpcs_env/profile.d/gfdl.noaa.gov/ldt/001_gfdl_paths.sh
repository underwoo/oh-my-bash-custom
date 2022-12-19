# Add additional paths to PATH (and other *PATH) environment variables as needed.
# This file use `pathmunge`, thus the function _must_ be defined before sourcing.

# GFDL helper applications
if [ -e /home/gfdl/bin2 ]
then
  pathmunge /home/gfdl/bin2
fi
