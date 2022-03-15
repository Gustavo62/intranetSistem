namespace :app do

    desc 'Tail remote log files'
    task :logs do
      on roles :app do
        logfile = ENV['LOG'] || fetch(:rails_env)
        execute %(tail -n0 -F #{shared_path}/log/#{logfile}.log | while read line; do echo "$(hostname): $line"; done)
      end
    end
    
    task :criar_tab_sub_cap do
        on roles :app do
          logfile = ENV['LOG'] || fetch(:rails_env)
          execute %(rake csv_substituto:import RAILS_ENV=production;rake csv_tabeliao:import RAILS_ENV=production;rake csv_cartorio:import RAILS_ENV=production)
        end
    end
    task :criar_master do
        on roles :app do
          logfile = ENV['LOG'] || fetch(:rails_env)
          execute %(rake criar_master:import RAILS_ENV=production) 
        end
    end
end