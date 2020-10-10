alias docker-remove-untagged-images='docker rmi $(docker images -q --filter "dangling=true")'
alias docker-remove-all-images='docker rmi $(docker images -q)'
alias docker-remove-stopped-container='docker rm $(docker ps -a -q)'

