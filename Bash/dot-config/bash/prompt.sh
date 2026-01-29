PS1=""

PS1+="\n$( tput setaf 7 )┌─$( tput setab 0 && tput setaf 7 )  "
PS1+="$( tput setab 7 && tput setaf 0 && tput bold ) \h "
PS1+="\$( if [[ -n \${CONTAINER_ID+x} ]] &> /dev/null; then tput setab 6; printf \" \${CONTAINER_ID} \"; fi )"
PS1+="$( tput sgr0 && tput setab 8 && tput setaf 7 ) \t "
PS1+="$( tput setab 0 ) \$( jobs | wc -l ) "
PS1+="\$( if [[ -d .git/ ]] &> /dev/null; then tput setab 1; tput setaf 0; printf \"  \"; fi )"

PS1+="$( tput sgr0 )"
PS1+="\n$( tput setaf 7 )└─["
PS1+="\$( pwd | sed -e \"s/\/var\/home\/${USER}/ 󰮧/\" -e \"s/\/home\/${USER}/ 󰮧/\" -e \"s/\// $( tput setaf 4 )  $( tput setaf 7 ) /g\" ) "
PS1+="$( tput setaf 7 )]"

PS1+="$( tput sgr0 )"
PS1+="\n  "
