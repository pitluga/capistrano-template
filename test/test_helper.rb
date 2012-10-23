$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'capistrano/template'
require 'test/unit'
require 'mocks/mock_capistrano'

TEST_TEMPLATES = File.expand_path('../templates', __FILE__)
