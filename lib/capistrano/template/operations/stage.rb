module Capistrano
  module Template
    module Operations
      class Stage
        def initialize(capistrano)
          @capistrano = capistrano
        end

        def execute
          @capistrano.run(Shellwords.join(['mkdir', '-p', @capistrano.template.staging_dir]))
          @capistrano.template.published_files.each do |file|
            next if @capistrano.find_servers(file[:options]).empty?
            content = @capistrano.template.render(file[:template])
            io = TemplateIO.new(content, file[:template])
            @capistrano.transfer(:up, io, cleaned_path(file[:location]), file[:options])
          end
        end

        private
        def cleaned_path(location)
          parts = []
          Pathname.new(location).each_filename { |f| parts << f }
          File.join(@capistrano.template.staging_dir, parts.join('__'))
        end
      end
    end
  end
end
