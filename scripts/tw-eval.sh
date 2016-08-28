#!/bin/bash
#
# Felix Salfelder, 2016
# Holger Dell, 2016
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3, or (at your option) any
# later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
#
set -euo pipefail
IFS=$'\n\t'

if [ $# -lt 2 -o $# -gt 3 ]; then
	echo usage:
	echo "$0 <grfile> <timeout> [<program>]"
	exit 2
fi

file=$1
timeout=$2
killtime=1
version=1
TDVALIDATE=${TDVALIDATE-td-validate}

if [ -z "$file" ]; then
	echo need gr file >&2
	exit -1
fi

if [ ! -f $file ]; then
	echo $file does not exist >&2
	exit -1
fi

if [ -z ${td_outdir+x} ]; then
  td_outdir=$PWD
fi

file=$(realpath $file)
basename=${file##*/}
stem=${basename%.gr*}
me=${0##*/}

if [ $me = tw-eval-ex.sh ]; then
       mode=ex
       program=tw-exact
else
       mode=he
       program=tw-heuristic
fi

if [ ! -z ${tw_program+x} ]; then
  program=$tw_program
fi

if [ ! -z ${3+x} ]; then
	program="$3"
fi


tmpdir=$(mktemp --directory --tmpdir=/dev/shm $me-XXXXXXXX)
# Make sure to kill all descendant processes when tw-eval exits
trap "trap - SIGTERM && rm -rf $tmpdir && kill -KILL -- -$$ &> /dev/null && exit 0" SIGINT SIGTERM EXIT

input=$tmpdir/$stem.gr
out_td_tmp=$tmpdir/$stem.td
out_td=$td_outdir/$stem.td
errtmp=$tmpdir/err

exec 2>&1

# copy/extract input file to ramdisk
if [ ${file: -3} == ".xz" ]; then
  xzcat $file > $input
elif [ ${file: -4} == ".bz2" ]; then
  bzcat $file > $input
elif [ ${file: -5} == ".lmza" ]; then
  lzcat $file > $input
else
  cp $file $input
fi

# for convenience, create symbolic link in output directory
ln -s $file $td_outdir &> /dev/null || true

TW_EVAL_SEED=${TW_EVAL_SEED-`od -An -t u4 -N4 /dev/urandom | awk '{$1=$1};1'`}

echo =======what===============================

if ! which $program &>/dev/null; then
  echo Error: Program $program not found
  exit 1
fi

program=$(which $program)
program=$(realpath $program)
cd $(dirname $program)
echo program: $program

if [ -d .git ]; then
  echo "commit: $(git rev-parse HEAD || true)"
fi

echo input graph: $file
echo timeout: $timeout
echo random seed: $TW_EVAL_SEED
echo output td: $out_td

# set the current Unix time in milliseconds
start_time=$(($(date +'%s * 1000 + %-N / 1000000')))

TIMEFORMAT="HERETIME\n%e\n%U\n%S\n%P\n%M"
set +e
time_output=$( /usr/bin/time -f "$TIMEFORMAT" bash -c "timeout --kill-after=$killtime --signal=TERM $timeout \"$program\" -s $TW_EVAL_SEED ${TW_ARGS-} <  $input 2> $errtmp > $out_td_tmp" 2>&1 )
exit_status=$?
set -e
echo =======stderr output from program=========
cat $errtmp

echo =======intermediate results===============

# get graph's number of vertices
num_vertices=$(grep -e '^p' $input | cut -f 3 -d ' ' || true)
[ -n "$num_vertices" ] || num_vertices=-1

# everyone starts with a trivial tree decomposition
echo | awk '{printf "%10d %4d\n",0,'$num_vertices';}'

( grep -e '^c status' $out_td_tmp || true ) |
while read n
do
  echo $n | awk '{printf "%10d %4d\n",'"\$4-$start_time, \$3"';}'
done

echo =======validation=========================
dbs=$(grep -e '^s' $out_td_tmp | cut -f 4 -d ' ' || true)
if [ -z "$dbs" ]; then
	dbs=-1
fi

if [ $exit_status -eq 0 ]; then
  echo -n exited on its own
elif [ $exit_status -eq 124 ]; then
	echo -n exited when we sent TERM
else
  echo -n failure: either we sent KILL or it aborted
fi
echo " (exit_status=$exit_status)"

echo -n "tree decomposition: "
set +e
$TDVALIDATE $input $out_td_tmp
vresult=$?
set -e

echo =======run time===========================
time_output="${time_output##*HERETIME}"
time_runs=( $time_output )
time_real=${time_runs[0]}
time_user=${time_runs[1]}
time_sys=${time_runs[2]}
time_perc=${time_runs[3]}
time_mem=${time_runs[4]}
echo real: $time_real
echo user: $time_user
echo sys:  $time_sys
echo CPU%: $time_perc
echo mem:  $time_mem

echo =======misc===============================
echo "user: $(whoami)"
echo "cwd: $(pwd)"
echo "timestamp: $(date)"
echo -n "input sha1: "
sha1sum < $input || true
echo -n "treedec sha1: "
sha1sum < $out_td_tmp || true

echo decomposition bag size: $dbs
echo -n "valid treedecomposition: "
if [ $vresult -ne 0 ]; then
	echo no
else
	echo yes
fi

echo -n "number of lines in .td file: "
cat $out_td_tmp | wc -l

cp $out_td_tmp $out_td

echo =======csv================================
echo -n "$version; $basename; $timeout; $dbs; $vresult; $exit_status; "
echo    "$time_real; $time_user; $time_sys; $time_perc; $time_mem"

exit $vresult
