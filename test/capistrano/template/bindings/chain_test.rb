require File.expand_path('../../../../test_helper', __FILE__)

module Capistrano
  module Template
    module Bindings
      class ChainTest < Test::Unit::TestCase

        def test_method_missing_searches_bindings
          chain = Chain.new(HashBinding.new(:foo => 'bar'))
          assert_equal('bar', chain.foo)
        end

        def test_method_missing_raises_not_found_exception
          chain = Chain.new(HashBinding.new(:foo => 'bar'))
          exception = assert_raise(NoMethodError) { chain.baz }
          assert_match /baz/, exception.message
        end

        def test_chains_public_methods_are_undefined
          chain = Chain.new(HashBinding.new(:foo => 'bar'))
          assert_raises(NoMethodError) { chain.clone }
          assert_raises(NoMethodError) { chain.to_s }
          assert_raises(NoMethodError) { chain.inspect }
        end
      end
    end
  end
end
