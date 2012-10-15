require File.expand_path('../../../../test_helper', __FILE__)

module Capistrano
  module Template
    module Bindings
      class CapistranoBindingTest < Test::Unit::TestCase

        def setup
          @current_instance = Capistrano::Configuration.new
          Capistrano::Configuration.instance = @current_instance
        end

        def test_defined_returns_false_when_variable_is_not_available
          script_binding = CapistranoBinding.new
          assert_equal(false, script_binding.exists?(:var))
        end

        def test_defined_returns_true_when_variable_is_available
          @current_instance.set(:var, 'foo')
          script_binding = CapistranoBinding.new
          assert_equal(true, script_binding.exists?(:var))
        end

        def test_fetch_returns_the_value_of_the_variable
          @current_instance.set(:var, 'foo')
          script_binding = CapistranoBinding.new
          assert_equal('foo', script_binding.fetch(:var))
        end

      end
    end
  end
end
