Capistrano::Configuration.instance(true).load do
  set :database_name, nil
  set :database_user, nil
  
  namespace :database do
    task :configure do
      db_config = {
        "production" => {
          "adapter" => "mysql",
          "database" => database_name,
          "username" => database_user,
          "password" => database_pass,
          "host" => "localhost"
        }
      }
    end
  end
end
