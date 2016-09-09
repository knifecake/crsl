#!/bin/bash

PUMA_PID="tmp/pids/puma.pid"
power_cycle=1 # 1 for start; 0 for stop

while getopts ":d" opt; do
  case $opt in
    d)
      power_cycle=0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# remove parsed options
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

if [[ power_cycle -eq 1 ]]; then
  if [[ -s $PUMA_PID ]]; then
    echo "CRSL is already running."; exit 4
  fi

  echo "Precompiling assets and migrating database..."
  rails assets:precompile
  rails db:migrate

  mkdir -p tmp/sockets tmp/pids

  if [ ! -s ".rbenv-vars" ]; then
    echo "Rails need a secret key base in .rbenv-vars."; exit 2
  fi

  echo "Starting puma..."
  puma --daemon --config config/puma.rb

  echo "Puma is now running."
else
  if [[ ! -s $PUMA_PID ]]; then
    echo "CRSL is not running."; exit 3
  fi

  pid=$(cat $PUMA_PID)


  kill $pid; rm $PUMA_PID

  echo "Killed ${PUMA_PID}. Puma has stopped."
fi
