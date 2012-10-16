module Capistrano
  module Template
    module Bindings
      class CapistranoBinding
        def initialize(capistrano)
          @capistrano = capistrano
        end

        def exists?(variable)
          @capistrano.exists?(variable)
        end

        def fetch(variable)
          @capistrano.fetch(variable)
        end

      end
    end
  end
end
