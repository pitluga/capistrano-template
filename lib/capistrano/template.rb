require "erb"
require "capistrano"
require "capistrano/template/plugin"
require "capistrano/template/version"

Capistrano.plugin(:template, Capistrano::Template::Plugin)
