set :application, "FreeFallHighScoreWebStuff"
set :repository,  "git@github.com:FreeFallHighScore/FreeFallHighScoreWebStuff.git"
set :user, "ubuntu"

set :keep_releases, 3

set :scm, :git
set :branch, :boilerplate
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
#set :git_enable_submodules, 1

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/www/#{application}"

role :web, "ec2-184-73-117-129.compute-1.amazonaws.com"
role :app, "ec2-184-73-117-129.compute-1.amazonaws.com"
role :db,  "ec2-184-73-117-129.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :use_sudo, false

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "Temporary hack to kind of show correctly assets on the server."
end

after "deploy", "deploy:migrate"
