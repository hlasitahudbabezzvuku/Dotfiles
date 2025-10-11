printf '\n    _/        _/        _/               '
printf '\n   _/_/_/    _/_/_/    _/_/_/    _/_/_/_/'
printf '\n  _/    _/  _/    _/  _/    _/      _/   '
printf '\n _/    _/  _/    _/  _/    _/    _/      '
printf '\n_/    _/  _/    _/  _/_/_/    _/_/_/_/   \n'

printf '\n%s┌─────────── %sHlasitaHudbaBezZvuku%s ───────────┐%s' "$( tput setaf 8 )" "$( tput setaf 4 )" "$( tput setaf 8 )" "$( tput sgr0 )"
printf '\n  user:       %s' "$( whoami )"
printf '\n  hostname:   %s' "$( hostname )"
printf '\n  uptime:     %s' "$( uptime -p )"
printf '\n%s└────────────────────────────────────────────┘%s\n' "$( tput setaf 8 )" "$( tput sgr0 )"

