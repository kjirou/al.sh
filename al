#!/bin/sh

#/* vim: ft=bash */

#
# TODO:
# - add {cmd}
#   - local(-l) or global (-g) mode
# - remove
# - al {cmd}
#


CURRENT_ROOT=`pwd`
DATA_ROOT="${HOME}/.al"
INDEX_FILE="${DATA_ROOT}/index.dat"


# Initialization
if test ! -d $DATA_ROOT; then
  mkdir $DATA_ROOT
fi
if test ! -f $INDEX_FILE; then
  touch $INDEX_FILE
fi


# Extract sub-command from args
CMD='exec'
case "$1" in
  add|exec|remove)
    CMD="$1"
    shift
    ;;
esac


# Parse options
INVALID_ARGS='0'
ONLY_LOCAL='0'
while getopts 'l' flag; do
  case $flag in
    \?)
      INVALID_ARGS='1'
      break
      ;;
    l)
      ONLY_LOCAL='1'
      ;;
  esac
done

shift `expr $OPTIND - 1`

if test "$INVALID_ARGS" = '1'; then
  echo >&2 'Invalid args or options'
  exit 1
fi


echo "CMD=$CMD"
echo "INVALID_ARGS=$INVALID_ARGS"
echo "ONLY_LOCAL=$ONLY_LOCAL"
echo "OTHER=$@"
