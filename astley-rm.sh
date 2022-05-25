#! /bin/bash
# Rickroll whoever tries to desert this system, even root.
# To achieve this, set the appropriate aliases even in /etc/profile and similars.

rickroll(){
  echo "Never gonna desert this system..."
  xdg-open "http://youtu.be/dQw4w9WgXcQ" 2>&1 &
  curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash &
  exit
}

while getopts ":rf-" opt; do
  # Prevent '--force' to be detected as -r and -f
  if [ "$opt" = "-" ]; then
    OPTIND=$OPTIND+1
    continue
  fi
  if [ "$opt" = "r" ] || [ "$opt" = "f" ]; then
    if [ "$tmp" = "" ]; then
      tmp=$opt
      continue
    elif [ "$tmp" != "$opt" ]; then
      rickroll
    fi
  fi
done

for var in "$@"
do
  if [[ "$var" = "--force" && "$tmp" = "r" ]]; then
    rickroll
  fi
done

# If it's safe, just run rm
/bin/rm "$@"
exit $?
