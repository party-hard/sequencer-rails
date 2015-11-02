set :branch, `git symbolic-ref --short HEAD`.strip
set :rails_env, 'staging'

server 'sequencer.pro', user: 'sequencer', roles: %w(app web db worker), port: 9997

set :deploy_to, '/srv/sequencer/staging'

set :whenever_roles, :none
