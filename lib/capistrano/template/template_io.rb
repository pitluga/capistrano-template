module Capistrano
  module Template
    class TemplateIO < StringIO
      def initialize(content, template_name)
        super(content)
        @template_name = template_name
      end

      def to_s
        "Template<#{@template_name}>"
      end
    end
  end
end
