require File.expand_path('../../../test_helper', __FILE__)

class PluginTest < Test::Unit::TestCase
  def setup
    @config = Capistrano::Configuration.new
  end

  def test_template_plugin_is_available
    assert_nothing_raised do
      @config.template
    end
  end

  def test_render_erbs_the_given_template
    @config.set(:template_path, TEST_TEMPLATES)
    result = @config.template.render("hello.erb")
    assert_equal(result, "Hello from #{TEST_TEMPLATES}\n")
  end
end
