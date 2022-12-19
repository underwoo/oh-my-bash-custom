# Check if an SSH agent is running
if [ x"${SSH_AGENT_PID:+set}" = "xset" ]
then
  # Check if we are counting the number of shells using this
  # SSH agent
  if [ x"${SSH_AGENT_COUNT:+set}" = "xset" ]
  then
    agent_env=${HOME}/.ssh/agent_envs/$(hostname -s)
    # Get the current count from the agent file
    # Sourcing the file is the easiest
    . ${agent_env} > /dev/null
    if [ ${SSH_AGENT_COUNT} -gt 1 ]
    then
      # Decrement and save the result to the file
      sed -i -e "s/^SSH_AGENT_COUNT=${SSH_AGENT_COUNT}/SSH_AGENT_COUNT=$(expr $SSH_AGENT_COUNT - 1)/" ${agent_env}
    else
      # Kill the agent
      ssh-agent -k > /dev/null 2>&1
      # Remove the agent_env file
      \rm ${agent_env} > /dev/null 2>&1
    fi
  fi
fi
