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

  def test_publish_stores_where_templates_should_be_placed
    @config.template.publish('hello.erb', '/tmp/hello')
    assert_equal('hello.erb', @config.__template_published_files.first[:template])
    assert_equal('/tmp/hello', @config.__template_published_files.first[:location])
  end

  def test_publish_fills_in_the_options_hash_for_put
    @config.template.publish('hello.erb', '/tmp/hello', :mode => '0640', :roles => :app)
    assert_equal(:app, @config.__template_published_files.first[:options][:roles])
    assert_equal('0640', @config.__template_published_files.first[:options][:mode])
  end

  def test_publish_raises_an_argument_error_if_location_is_not_an_absolute_path
    assert_raises(ArgumentError) do
      @config.template.publish('hello.erb', 'hello', :mode => '0640', :roles => :app)
    end
  end

  def test_without_current_task_removes_any_existing_task_call_frames
    Thread.current[:task_call_frames] = :original
    called = false
    @config.template.without_current_task do
      called = true
      assert_equal [], Thread.current[:task_call_frames]
    end
    assert_equal true, called
    assert_equal :original, Thread.current[:task_call_frames]
  end
end
