module Capistrano
  module Template
    module Plugin
      def render(template)
        content = File.read(File.join(template_path, template))
        ERB.new(content).result(chain.instance_eval { binding })
      end

      def publish(template, location, options = {})
        files_to_publish.push(:template => template, :location => location, :options => options)
      end

      private
      def template_path
        fetch(:template_path, File.join('config', 'deploy', 'templates'))
      end

      def template_bindings
        fetch(:template_bindings, [Bindings::CapistranoBinding.new(self)])
      end

      def files_to_publish
        set(:__template_files_to_publish, []) unless exists?(:__template_files_to_publish)
        fetch(:__template_files_to_publish)
      end

      def chain
        @__template_chain ||= Bindings::Chain.new(*template_bindings)
      end
    end
  end
end
