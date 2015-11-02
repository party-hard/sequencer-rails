require 'capistrano/setup'
require 'capistrano/deploy'

require "airbrussh/capistrano"
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano-npm'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
