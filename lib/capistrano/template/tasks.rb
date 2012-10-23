Capistrano::Configuration.instance && Capistrano::Configuration.instance.load do
  namespace :templates do
    desc "Uploads the templated files to the staging directory."
    task :stage do
      template.without_current_task do
        template.stage
      end
    end
  end
end
