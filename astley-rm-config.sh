#!/bin/bash

usage="$(basename "$0") [-h] [-s] [-f FILE1 (FILE2 ...)] -- Set up the aliases for astley-rm.

where:
    -h  show this help text
    -s  output the aliases
    -f  specify manually the file(s) where to output the aliases.

If the -f option is not used, the aliases will be added to /etc/profile and /etc/bash.bashrc.
Once you have ran this script, restart your shell session in order to apply the aliases
Please remember to manually delete these aliases before uninstall."

config="\n# lines added by /usr/bin/astley-rm-config\nalias rm='/usr/bin/astley-rm'\nalias sudo='sudo '\n"

while getopts ':hsf:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    s) echo -e "$config"
       exit
       ;;
    f) if [ -z $2 ]; then
         echo "Please specify at least one file where to output the aliases."
         exit 1
       fi;
       shift 1
       for file in $@; do
         echo -e $config >> $file
       done
       exit
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
echo -e $config >> /etc/profile
echo -e $config >> /etc/bash.bashrc
