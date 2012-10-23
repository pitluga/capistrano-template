require 'erb'
require 'capistrano'
require 'capistrano/template/plugin'
require 'capistrano/template/version'
require 'capistrano/template/bindings/capistrano_binding'
require 'capistrano/template/bindings/chain'
require 'capistrano/template/bindings/hash_binding'
require 'capistrano/template/operations/stage'
require 'capistrano/template/tasks'
require 'capistrano/template/template_io'

Capistrano.plugin(:template, Capistrano::Template::Plugin)
