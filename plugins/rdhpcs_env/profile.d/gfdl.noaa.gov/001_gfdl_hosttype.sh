# GFDL has several host types.  The hostname determines the host type:
#  * ldt - Linux Desktop
#  * mlt - Mac Laptop
#  * wlt - Windows Laptop
# This script will set the GFDL_HOSTTYPE variable, and will source
# the type specific scripts.
GFDL_HOSTTYPE=$(hostname | awk '{print $1}' | cut -f1 -d-)

for i in $(dirname ${BASH_SOURCE})/${GFDL_HOSTTYPE}/*.sh
do
  if [ -r "$i" ]
  then
    if [ "${-#*i}" != "$-" ]
    then
      . "$i"
    else
      . "$i" >/dev/null 2>&1
    fi
  fi
done
