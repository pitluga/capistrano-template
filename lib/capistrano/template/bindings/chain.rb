module Capistrano
  module Template
    module Bindings
      class Chain

        def initialize(*bindings)
          @bindings = bindings
        end

        def method_missing(name, *args, &block)
          found_binding = @bindings.detect { |b| b.exists?(name) }
          super if found_binding.nil?
          found_binding.fetch(name)
        end

      end
    end
  end
end
