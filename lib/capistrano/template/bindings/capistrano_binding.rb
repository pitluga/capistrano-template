module Capistrano
  module Template
    module Bindings
      class CapistranoBinding

        def exists?(variable)
          Capistrano::Configuration.instance.exists?(variable)
        end

        def fetch(variable)
          Capistrano::Configuration.instance.fetch(variable)
        end

      end
    end
  end
end
