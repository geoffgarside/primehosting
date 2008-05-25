Capistrano::Configuration.instance(true).load do
  set :app_port, nil
  set :use_sudo, false
end
