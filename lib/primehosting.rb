$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'highline/import'

require 'primehosting/mongrel'
require 'primehosting/database'

Capistrano::Configuration.instance(true).load do
  # Setup default values
  set :rails_env, "production"
  set :use_sudo, false
  set :app_port, nil
  
  set(:deploy_to) { "/usr/home/#{user}/apps/#{application}" }
end
