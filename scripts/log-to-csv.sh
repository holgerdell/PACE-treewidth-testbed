#!/bin/bash
#
# Argument is a list of logdirs (e.g. logs/2016-08-26.22-34-05)
# Writes the collected last lines of each .log file to stdout
#
set -euo pipefail
IFS=$'\n\t'

if [ $# -lt 1 ]; then
	echo usage:
	echo "$0 <dir> [<dir> ...]"
  echo "where <dir> is a logdir (e.g. logs/2016-08-26.22-34-05)"
	exit 2
fi

DIRS=$*

for DIR in $DIRS;
do
  if [ ! -d $DIR ]; then
    echo "Error: Cannot find directory $DIR" >&2
    exit 1
  fi
done

echo "mode; se_or_pa; number; solver; ver; instance; timeout; width; validation_result; exit_status; time_real; time_user; time_sys; time_perc; time_mem"
for DIR in $DIRS;
do
  echo "Collecting tail -n1 of files in $DIR/mode-se_or_pa/number/executable/*.log" >&2

  ALL=`find $DIR -mindepth 3 -maxdepth 3 -type d -printf '%P\n' | sort -n`

  for dir in $ALL
  do
    executable=$(basename $dir)
    number=$(basename $(dirname $dir))
    comp=$(basename $(dirname $(dirname $dir)))
    mode=${comp:0:2}
    se_or_pa=${comp:3:2}
    echo "$dir" >&2
    find $DIR/$dir -name '*.log' -exec tail -n 1 {} \; \
      | sed -e "s/^/$mode; $se_or_pa; $number; $executable; /"
#      | grep -v -e 'tw-eval error: cannot use timeout=auto on instance' \
  done
done | sort -V
echo "All csv data written to stdout" >&2
