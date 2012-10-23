require File.expand_path('../../../../test_helper', __FILE__)

module Capistrano
  module Template
    module Operations
      class StageTest < Test::Unit::TestCase
        def setup
          @capistrano = MockCapistrano.new
          @capistrano.set(:template_path, TEST_TEMPLATES)
        end

        def test_execute_creates_staging_directory
          @capistrano.template.stage
          assert_equal 'mkdir -p /tmp/cap-templates', @capistrano.invocations.first[:command]
        end

        def test_execute_uploads_files_to_the_staging_directory
          @capistrano.server 'example.com', :app
          @capistrano.template.publish 'hello.erb', '/usr/local/bin/hello'
          @capistrano.template.stage
          assert_equal :up, @capistrano.transfers.first[:direction]
          assert_match /Hello from/, @capistrano.transfers.first[:from].read
          assert_equal '/tmp/cap-templates/usr__local__bin__hello', @capistrano.transfers.first[:to]
        end

        def test_execute_uploads_files_only_to_the_given_roles
          @capistrano.server 'example.com', :app
          @capistrano.template.publish 'hello.erb', '/usr/local/bin/hello', :roles => :app
          @capistrano.template.stage
          assert_equal :up, @capistrano.transfers.first[:direction]
          assert_match /Hello from/, @capistrano.transfers.first[:from].read
          assert_equal '/tmp/cap-templates/usr__local__bin__hello', @capistrano.transfers.first[:to]
          assert_equal :app, @capistrano.transfers.first[:options][:roles]
        end

        def test_execute_ignores_roles_that_are_not_defined
          @capistrano.template.publish 'hello.erb', '/usr/local/bin/hello', :roles => :app
          @capistrano.template.stage
          assert_equal [], @capistrano.transfers
        end
      end
    end
  end
end
