# run with cap -f vanilla.rb
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'capistrano'
require 'capistrano/template'

set :template_path, 'templates'
set :name, 'world'
server 'localhost', :app

template.publish 'hello_world.erb', '/tmp/hello_w', :roles => :app
template.publish 'goodbye_world.erb', '/tmp/goodbye_w', :roles => :web


desc "place a rendered template in /tmp/hello_world"
task :test_render, :roles => :app do
  put template.render('hello_world.erb'), '/tmp/hello_world'
  puts capture "cat /tmp/hello_world"
end
