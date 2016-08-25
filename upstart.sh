#!/bin/bash
echo "Precompiling assets and migrating database..."
rails assets:precompile
rails db:migrate

mkdir -p tmp/sockets tmp/pids

echo "Starting puma..."
puma --daemon --config config/puma.rb

echo "Puma is now running."
