set :repo_url,        'git@github.com:Gustavo62/intranet-anoreg.git'
set :application,     'intranet'
set :user,            'intranet'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/var/www/intranet"

append :linked_files, "config/database.yml", "config/storage.yml", "config/master.key","config/application.yml"
append :linked_dirs, "log", "tmp"
 
set :keep_releases, 5
set :migration_role, :app

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state" 
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log" 
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled" 
set :rvm_ruby_version, '2.7.1'
## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
 
namespace :puma do
  desc 'Create Puma dirs'
  task :create_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
 
  desc "Restart Nginx"
  task :nginx_restart do
    on roles(:app) do
      execute "sudo service nginx restart"
    end
  end
 
  before :start, :create_dirs
  after :start, :nginx_restart
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma