module Capistrano
  module Template
    module Plugin
      def render(template)
        content = File.read(File.join(template_path, template))
        ERB.new(content).result(lambda { binding_chain })
      end

      private
      def template_path
        fetch(:template_path, File.join('config', 'deploy', 'templates'))
      end

      def template_bindings
        fetch(:template_bindings, [Bindings::CapistranoBinding.new])
      end

      def binding_chain
        @binding_chain ||= Bindings::Chain.new(*template_bindings)
      end
    end
  end
end
