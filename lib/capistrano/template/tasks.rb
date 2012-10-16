Capistrano::Configuration.instance.load do
  namespace :templates do
    desc <<-DESC
    Publish files to appropriate places.
    DESC
    task :publish do
      files = fetch(:__template_files_to_publish, [])
      files.each do |file|
        put(template.render(file[:template]), file[:location])
      end
    end
  end
end
