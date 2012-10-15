module Capistrano
  module Template
    module Plugin
      def render(template)
        content = File.read(File.join(template_path, template))
        ERB.new(content).result(binding)
      end

      private
      def template_path
        fetch(:template_path, File.join('config', 'deploy', 'templates'))
      end
    end
  end
end
