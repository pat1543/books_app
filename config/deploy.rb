# frozen_string_literal: true

# config valid only for current version of Capistrano
lock "3.7.0"

set :application, "books_app"
set :repo_url, "git@github.com:pat1543/books_app.git"
set :deploy_to, "/opt/books_app"
set :linked_files, fetch(:linked_files, []).push("config/master.key")
set :format, :pretty
set :log_level, :debug
set :rbenv_type, :system
set :rbenv_ruby, File.read(".ruby-version").strip
set :rbenv_path, "/opt/rbenv"
append :linked_dirs, ".bundle"
append :linked_files, "config/master.key"
set :stage, "production"

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", ".env"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
set :default_env,  path: "/opt/ruby/bin:$PATH",
                    RAILS_MASTER_KEY: "86ca6c3caa1c9de46dcbb956751aa654"

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :confirm do
    on roles(:app) do
      puts "This stage is '#{fetch(:stage)}'. Deploying branch is '#{fetch(:branch)}'."
    end
  end

  desc "Initial Deploy"
  task :initial do
    on roles(:app) do
      invoke "deploy"
    end
  end

  before :starting, :confirm
end
