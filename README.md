# Capistrano::Template

A [capistrano](http://capistranorb.com/) plugin that aids in rendering templates.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-template'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-template

## Usage

Best explained with an example deploy.rb file.

```ruby
require 'capistrano/template'

set :application, "example"
# ...

task :configure_apache, :roles => :web do
  put(template.render('vhost.conf'), "/etc/apache2/sites-available/#{application}.conf")
end
```

## Supported Functions

All supported functions live under the ```template``` namespace.

### render(template_name)

ERBs the given template and returns the result.

## Configuration Variables

### template_path

The location to search for templates. Relative to the current working directory of the cap command. Defaults to ```config/deploy/templates```.


### template_bindings

An array of bindings that represent the search path for variables when rendering templates. An extension point to allow external sources for data. Defaults to ```[Bindings::CapistranoBinding.new]```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
