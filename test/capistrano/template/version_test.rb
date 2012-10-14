require File.expand_path('../../../test_helper', __FILE__)

class VersionTest < Test::Unit::TestCase
  def test_version_is_set
    assert_not_nil Capistrano::Template::VERSION
  end
end
