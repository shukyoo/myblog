# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'myblog'
set :repo_url, 'git@github.com:shukyoo/myblog.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/myblog'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

# root = "/var/www/myblog/current"
# set :root,"/var/www/myblog/current"
# shared = "/var/www/myblog/shared"
# set :unicorn_pid, "#{shared}/tmp/pids/unicorn_oceaneye.pid"
# CMD="cd $APP_ROOT; bundle exec unicorn -D -c $APP_ROOT/config/unicorn.rb -E production"
# set :unicorn_config,"#{root}/config/unicorn.rb"

# production_log = "#{shared}/log/production.log"

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/assets }
set :linked_files, %w{config/database.yml config/config.yml}


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

  after :finished, :restart_unicorn do
    on roles(:app), in: :sequence, wait: 20 do
      execute "sudo service unicorn_myblog_production restart"
    end
  end

end
