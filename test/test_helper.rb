$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'capistrano/template'
require 'test/unit'

TEST_TEMPLATES = File.expand_path('../templates', __FILE__)
