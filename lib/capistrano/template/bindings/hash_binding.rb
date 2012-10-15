module Capistrano
  module Template
    module Bindings
      class HashBinding

        def initialize(hash)
          @hash = hash
        end

        def exists?(variable)
          @hash.has_key?(variable)
        end

        def fetch(variable)
          @hash.fetch(variable)
        end

      end
    end
  end
end
