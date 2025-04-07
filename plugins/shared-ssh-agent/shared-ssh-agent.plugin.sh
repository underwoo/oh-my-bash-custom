# Connect to an already running ssh-agent, or start one
#
# Check if an agent is already running and usable
ssh-add -l > /dev/null 2>&1
if [ "$?" == 2 ]
then
  agent_envs_dir=${HOME}/.ssh/agent_envs
  agent_env=${agent_envs_dir}/$(hostname -s)

  if [ ${skip_agent:-no} = "no" ]
  then

    if [ -r ${agent_env} ]
    then
      . ${agent_env} > /dev/null
    fi

    # Check if agent information in the ~/.ssh/agent_env file points
    # to a valid agent
    ssh-add -l > /dev/null 2>&1
    status=$?
    if [ "$status" -eq 2 ]
    then
      # Ensure agent_envs_dir exists and is a directory, if not create it
      # If it is not a file, skip everything else.
      if [ ! -e ${agent_envs_dir} ]
      then
        mkdir -p ${agent_envs_dir} >/dev/null 2>&1
        test $? -eq 0 && skip_agent=yes
      else
        if [ ! -d ${agent_envs_dir} ]
        then
          skip_agent=yes
        fi
      fi
      if [ ${skip_agent:-no} = "no" ]
      then
        # Make sure an old agent file was not left around, which can
        # happen if the connection is simply lost.
        \rm -f ${agent_env}
        # Start a new agent
        (umask 066; ssh-agent > ${agent_env})
        echo "SSH_AGENT_COUNT=1; export SSH_AGENT_COUNT;" >> ${agent_env}
        . ${agent_env} > /dev/null
      fi
    else
      if [ x"${SSH_AGENT_PID:+set}" = "xset" -a x"${SSH_AGENT_COUNT:+set}" = "xset" ]
      then
        # Increase the SSH_AGENT_COUNT
        sed -i -e "s/^SSH_AGENT_COUNT=${SSH_AGENT_COUNT}/SSH_AGENT_COUNT=$(expr $SSH_AGENT_COUNT + 1)/" ${agent_env}
        export SSH_AGENT_COUNT=$(expr ${SSH_AGENT_COUNT} + 1)
      fi
    fi
  fi
fi

unset agent_envs_dir
unset agent_env
unset skip_agent
