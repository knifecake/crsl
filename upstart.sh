#!/bin/bash
echo "Precompiling assets and migrating database..."
rails assets:precompile
rails db:migrate

mkdir -p tmp/sockets tmp/pids

if [ -f ".rbenv-vars" ]; then
  echo "Rails need a secret key base in .rbenv-vars."; exit 1
fi

echo "Starting puma..."
puma --daemon --config config/puma.rb

echo "Puma is now running."
