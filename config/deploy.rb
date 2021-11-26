# config valid for current version and patch releases of Capistrano
lock '~> 3.16.0'

# デプロイするアプリケーション名
set :application, 'boditore_prototype'

# cloneするgitのレポジトリ
set :repo_url, 'git@github.com:sabakantaro/boditore_prototype.git'

# deployするブランチ。デフォルトはmasterなのでなくても可
set :branch, 'master'

# deploy先のディレクトリ
set :deploy_to, '/var/www/rails/boditore_prototype'

# シンボリックリンクをはるファイル
set :linked_files, fetch(:linked_files, []).push('config/master.key')

# シンボリックリンクをはるフォルダ。
set :linked_dirs,
    fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# プロセス番号を記載したファイルの場所
# set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# 保持するバージョンの個数
# Unicornの設定ファイルの場所
# set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
# set :keep_releases, 5

# rubyのバージョン
# set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'

# どの公開鍵を利用してデプロイするか
# set :ssh_options, auth_methods: ['publickey'],
#                 keys: ['~/.ssh/boditore_key_rsa']

# 出力するログのレベル。
set :log_level, :debug

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'

    # task :set_default_env do
    #     set :default_env, fetch(:default_env).merge(ssm_env)
    # end
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |_host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
