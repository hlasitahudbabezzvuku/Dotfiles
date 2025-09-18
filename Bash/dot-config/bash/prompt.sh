PS1=""

PS1+="\n$( tput setaf 237 )┌─$( tput setab 235 && tput setaf 7 )  "
PS1+="$( tput setab 7 && tput setaf 235 && tput bold ) \h "
PS1+="\$( if [[ -n \${CONTAINER_ID+x} ]] &> /dev/null; then tput setab 6; printf \" \${CONTAINER_ID} \"; fi )"
PS1+="$( tput sgr0 && tput setab 235 && tput setaf 7 ) \t "
PS1+="$( tput setab 234 ) \$( jobs | wc -l ) "
PS1+="\$( if [[ -d .git/ ]] &> /dev/null; then tput setab 233; printf \"  \"; fi )"

PS1+="$( tput sgr0 )"
PS1+="\n$( tput setaf 237 )└─["
PS1+="$( tput setaf 7 )\$( pwd | sed -e \"s/\/home\/${USER}/ 󰮧/\" -e \"s/\// $( tput setaf 238 )  $( tput setaf 7 ) /g\" ) "
PS1+="$( tput setaf 237 )]"

PS1+="$( tput sgr0 )"
PS1+="\n  "

# PS1+="$( tput setaf 8 )┌─$( tput setab 4 && tput setaf 0 )  "
# PS1+="$( tput setab 8 && tput setaf 7 ) \t "
# PS1+="$( tput setab 0 ) \$( jobs | wc -l ) "
#
# PS1+="$( tput setaf 0 )"
# PS1+="\$( if [[ -n \${CONTAINER_ID+x} ]] &> /dev/null; then tput setab 2; printf \" \${CONTAINER_ID} \"; fi )"
# PS1+="\$( if [[ -d .git/ ]] &> /dev/null; then tput setab 1; printf \"  \"; fi )"
#
# PS1+="$( tput sgr0 )"
# PS1+="\n$( tput setaf 8 )└─[$( tput setaf 7 )\$( pwd | sed -e \"s/\/home\/${USER}/ 󰮧/\" -e \"s/\// $( tput setaf 8 )$( tput setaf 7 ) /g\" ) $( tput setaf 8 )]"
# PS1+="\n  $( tput sgr0 )"
