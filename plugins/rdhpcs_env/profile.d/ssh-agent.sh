# Connect to an already running ssh-agent, or start one
#
# First, check if an agent is already running and usable
ssh-add -l > /dev/null 2>&1
if [ "$?" == 2 ]
then
  if [ -r ~/.ssh/agent_env.$(hostname -s) ]
  then
    eval $(<~/.ssh/agent_env.$(hostname -s)) > /dev/null
  fi

  # Check if agent information in the ~/.ssh/agent_env file points
  # to a valid agent
  ssh-add -l > /dev/null 2>&1
  if [ "$?" == 2 ]
  then
    # Start a new agent
    (umask 066; ssh-agent > ~/.ssh/agent_env.$(hostname -s))
    eval $(<~/.ssh/agent_env.$(hostname -s)) > /dev/null
  fi
fi
