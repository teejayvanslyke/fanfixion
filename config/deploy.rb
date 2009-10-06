default_run_options[:pty] = true
set :rails_env, "production" 
set :application, "emo"
set :repository,  "git@github.com:teejayvanslyke/emo.git"
set :scm,   "git"
set :user,  "deploy"
set :branch, "master"
set :deploy_to, "/home/deploy/#{application}"
set :deploy_via, :remote_cache

#Change this if not culturejam.com
set :location, "tjvanslyke.com"
role :app, location
role :web, location
role :db,  location, :primary => true

after 'deploy:start', 'poller:start'

deploy.task :start do
  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  run "touch #{current_path}/tmp/restart.txt"
end

deploy.task :stop do
end

deploy.task :restart do
  stop
  start
end

namespace :poller do
  desc "start the Twitter polling service"
  task :start do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} script/poller start"
  end

  task :stop do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} script/poller stop"
  end
end
