# Load DSL and Setup Up Stages
require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/puma'

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Daemon
install_plugin Capistrano::Puma::Workers
install_plugin Capistrano::Puma::Nginx 
# Loads custom tasks from 'lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
Dir.glob('lib/capistrano/**/*.rb').each { |r| import r }