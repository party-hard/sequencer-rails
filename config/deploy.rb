# config valid only for current version of Capistrano
lock '3.4.0'

set :rbenv_ruby, '2.2.2'
set :bundle_flags, '--deployment --quiet --clean'

set :application, 'sequencer'
set :repo_url, 'git@github.com:party-hard/sequencer-rails.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default value for :scm is :git
set :scm, :git

# Default value for :log_level is :debug
#set :log_level, :info

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :linked_dirs, fetch(:linked_dirs, []).push(*%w(log tmp/pids tmp/sockets sequencer-react/node_modules vendor/bundle ))

after 'bundler:install', 'npm:install'
after 'npm:install', 'webpack:build'

after 'deploy:publishing', 'unicorn:reload'
