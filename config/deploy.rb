server '192.168.0.250', port: '65022', roles: [:web, :app, :db], primary: true
set :repo_url,        'git@github.com:Gustavo62/intranet-anoreg.git'
set :application,     'intranet'
set :user,            'intranet'
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :use_sudo, true
# Don't change these unless you know what you're doing
set :pty,             true 
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/var/www/intranet"

append :linked_files, "config/database.yml", "config/storage.yml", "config/master.key","config/application.yml"
append :linked_dirs, "log", "tmp"
 
set :keep_releases, 5
set :migration_role, :app


set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"
 
set :rvm_ruby_version, '2.7.1' 
set :default_env, {
  PATH: '$HOME/.npm-packages/bin/:$PATH',
  NODE_ENVIRONMENT: 'production', 
  "RAILS_ENV" => "production",
  "RAILS_MASTER_KEY" => ENV["RAILS_MASTER_KEY"]
}
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
  # make sure we're deploying what we think we're deploying
  before :deploy, "deploy:check_revision"
  # only allow a deploy with passing tests to deployed
  before :deploy, "deploy:run_tests"
  # compile assets locally then rsync
  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'

  # remove the default nginx configuration as it will tend
  # to conflict with our configs.
  before 'deploy', 'nginx:remove_default_vhost'

  # reload nginx to it will pick up any modified vhosts from
  # setup_config
  after 'deploy', 'nginx:reload'

  # Restart monit so it will pick up any monit configurations
  # we've added
  after 'deploy', 'monit:restart'

  # As of Capistrano 3.1, the `deploy:restart` task is not called
  # automatically.
  after 'deploy:publishing', 'deploy:restart'
end
 

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma