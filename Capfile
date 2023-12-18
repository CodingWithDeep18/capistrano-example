# Load DSL and set up stages
require "capistrano/setup"
require "Capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/setup'
require 'Capistrano/deploy'

require 'Capistrano/rails'
require 'Capistrano/bundler'
require 'Capistrano/rvm'
require 'Capistrano/passenger'
require "whenever/Capistrano"

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }