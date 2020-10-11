setAliasForLastCommand () {
  if [ $# -eq 1 ]; then

    # get last command from the history
    lastCommand=$(history | tail -n 2 | head -n 1 | sed -e 's|^\s*[0-9]*\s*||' -e 's|\x27|\x27"\x27"\x27|g')
    aliasName=$1

    # repeat until available alias found
    while true; do
      # check if alias exists
      type $aliasName >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        echo "$aliasName already exists - enter another alias name."
        read aliasName
      else
        break
      fi
    done

    # set last command as alias and write to file
    echo "alias $aliasName='$lastCommand'" >> ~/.bash_aliases

    # load the new alias
    . ~/.bash_aliases

  else
    # display usage information
    echo "Usage: setAliasForLastCommand <aliasName>"
    echo "short: a <aliasName>"
    echo
    echo "Sets an alias for the last command."
  fi
}

alias a='setAliasForLastCommand'
