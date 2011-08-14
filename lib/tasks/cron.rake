desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  Rake::Task["import_youtube_videos"].execute
end
