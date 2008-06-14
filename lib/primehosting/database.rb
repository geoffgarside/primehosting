Capistrano::Configuration.instance(true).load do
  set :database_name, nil
  set :database_user, proc { ask("What is your database username?  ") { |q| q.default = user } }
  set :database_pass, proc { ask("What is your database password?  ") { |q| q.echo = "*" } }
  
  namespace :database do
    task :configure do
      db_config =<<EOF
production:
  adapter: mysql
  database: #{database_name}
  username: #{database_user}
  password: #{database_pass}
  host: 127.0.0.1
EOF
      run "if test ! -d #{shared_path}/config/; then mkdir -p #{shared_path}/config/; fi"
      put db_config, "#{shared_path}/config/database.yml"
      
      puts "You should now add the following to your deploy.rb file"
      puts "after 'deploy:update_code', 'database:copy_config'"
    end
    
    task :copy_config do
      on_rollback {
        puts "*** File shared/config/database.yml is missing. ***"
        puts "*** Run cap database:configure to generate and upload. ***"
      }
      
      run "cp #{shared_path}/config/database.yml #{release_path}/config/"
    end
  end
  
  after "deploy:setup", "database:configure"
end
