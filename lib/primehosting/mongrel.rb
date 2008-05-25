Capistrano::Configuration.instance(true).load do
  namespace :mongrel do
    task :start, :roles => :app, :except => { :no_release => true } do
      send(run_method, "mongrel_rails start #{mongrel_start_args.join(" ")}")
    end
    
    task :stop, :roles => :app, :except => { :no_release => true } do
      send(run_method, "mongrel_rails stop #{mongrel_args.join(" ")}")
    end
    
    task :restart, :roles => :app, :except => { :no_release => true } do
      send(run_method, "mongrel_rails restart #{mongrel_args.join(" ")}")
    end
  end
  
  def mongrel_args
    [["-c", release_path],
     ["-P", release_path + "log/mongrel.pid"]]
  end
  
  def mongrel_start_args
    [["-d"],
     ["-e", rails_env],
     ["-p", app_port],
     ["-a", "127.0.0.1"],
     ["-l", release_path + "log/mongrel.log"]] + default_mongrel_args
  end
end
