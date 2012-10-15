require File.expand_path('../../../../test_helper', __FILE__)

module Capistrano
  module Template
    module Bindings
      class HashBindingTest < Test::Unit::TestCase

        def test_defined_returns_false_when_variable_is_not_available
          hash_binding = HashBinding.new({})
          assert_equal(false, hash_binding.exists?(:var))
        end

        def test_defined_returns_true_when_variable_is_available
          hash_binding = HashBinding.new(:var => 'foo')
          assert_equal(true, hash_binding.exists?(:var))
        end

        def test_fetch_returns_the_value_of_the_variable
          hash_binding = HashBinding.new(:var => 'foo')
          assert_equal('foo', hash_binding.fetch(:var))
        end

      end
    end
  end
end
