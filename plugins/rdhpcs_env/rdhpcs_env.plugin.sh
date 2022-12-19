# pathmunge is a simple shell function that will only add a new path
# to PATH if it doesn't already exist in PATH.  pathmunge is undefined
# at the end of this script.
pathmunge () {
  case ":${PATH}:" in
    *:"$1":*)
    ;;
    *)
    if [ "$2" = "after" ]
    then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  esac
}

# Get the host domain
HOSTDOMAIN=$(hostname | awk '{print $1}' | cut -f2- -d.)
HOST=$(hostname -s)

RDHPCS_ENV_DIR=$(dirname $BASH_SOURCE)
# Source the profile.d items.  Start with the items for the hostdomain,
# followed by items specific to the host, then the items for all hosts.
for i in ${RDHPCS_ENV_DIR}/profile.d/${HOSTDOMAIN}/*.sh \
         ${RDHPCS_ENV_DIR}/profile.d/$(hostname -s)/*.sh \
         ${RDHPCS_ENV_DIR}/profile.d/*.sh
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

RDHPCS_ENV=true

unset i
unset RDHPCS_ENV_DIR
unset pathmunge
