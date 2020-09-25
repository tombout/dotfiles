SSHAGENT=`which ssh-agent`
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi

# Kill in .bash_logout with:
#if [ ${SSH_AGENT_PID+1} == 1 ]; then
#    ssh-add -D
#    ssh-agent -k > /dev/null 2>&1
#    unset SSH_AGENT_PID
#    unset SSH_AUTH_SOCK
#fi