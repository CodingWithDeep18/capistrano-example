lock "3.10.2"

		server '54.88.139.244', port: 22, roles: [:web, :app, :db], primary: true

		set :repo_url, '< repo url >'
		set :application, < app_name >'
		set :user, 'ubuntu' #server user

		set :rvm_bin_path, "$HOME/bin"
		set :rvm_ruby_version, 'ruby_version@gemset_name'

		# Don't change these unless you know what you're doing
		set: pty, true
		set :use_sudo, false
		set :rails_env, "production"
		set :stage, :production
		set :deploy_via, :remote_cache
		set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

		set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }

		set :branch, :< branch name >

		namespace: deploy do

		desc 'Initial Deploy'
		task: initial do
		on roles(:app) do
		before 'deploy: restart'
		invoke 'deploy'
		end
		end

		set :linked_files, %w{config/database.yml}

		after :finishing, :compile_assets
		after :finishing, :cleanup
		after :finishing, :restart
		end