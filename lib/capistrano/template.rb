require 'erb'
require 'capistrano'
require 'capistrano/template/plugin'
require 'capistrano/template/version'
require 'capistrano/template/bindings/capistrano_binding'
require 'capistrano/template/bindings/chain'
require 'capistrano/template/bindings/hash_binding'

Capistrano.plugin(:template, Capistrano::Template::Plugin)
