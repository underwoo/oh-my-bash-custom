# Determine the NCRC Host type
# TODO: Find a cleaner way to get the node type
# using the host name is a bit dangerous
#
# There are currently three types of nodes:
# - Front end nodes (hostname of gaea[56]?
# - DTN nodes (hostname of dtn??
# - Compute nodes (hostnames of c[56]n*
function get_node_type_ {
  # The node type is determined by the host name
  local host_type=$( hostname -s | awk '{print $1}' | cut -c1-3 )
  case $host_type in
  gae ) host_type=fen ;;
  dtn | c5n | c6n ) ;;
  * ) host_type=unk ;;
  esac
  echo $host_type
} 

NCRC_NODE=$( get_node_type_ )

unset get_node_type_

