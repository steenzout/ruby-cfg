require 'test/unit'
require 'lib/steenzout-cfg'



class TestConfigurationManager < Test::Unit::TestCase

  def setup

    Steenzout::ConfigurationManager.load 'test/simple.yaml'

  end



  def test_configuration_for_gem

    config = Steenzout::ConfigurationManager.configuration_for_gem 'steenzout-cfg'
    assert_equal({:property => 'value1'}, config)

  end



  def test_load

    # 1. loading another file with same gem configuration
    Steenzout::ConfigurationManager.load 'test/another.yaml'

    config = Steenzout::ConfigurationManager.configuration_for_gem 'steenzout-cfg'
    assert_equal({:property => 'value2'}, config)


    # 2. loading another file with no duplicate configuration
    Steenzout::ConfigurationManager.load 'test/yetanother.yaml'

    config = Steenzout::ConfigurationManager.configuration_for_gem 'steenzout-cfg'
    assert_equal({:property => 'value2'}, config)

    config = Steenzout::ConfigurationManager.configuration_for_gem 'steenzout-dao'
    assert_equal({:property => 'value3'}, config)


    # 3. loading from inexistent file
    assert_raises ArgumentError do
      Steenzout::ConfigurationManager.load 'test/inexistent.yaml'
    end

  end

end