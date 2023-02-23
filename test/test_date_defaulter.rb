require 'minitest/autorun'
require_relative '../lib/date_defaulter'

class DateDefaulterTest < Minitest::Test
  def test_to_s
    date = Date.new(2016, 10, 21)

    DateDefaulter.format = '%d/%m/%Y'
    assert_equal(date.to_s, '21/10/2016')

    DateDefaulter.format = '%m/%d/%Y'
    assert_equal(date.to_s, '10/21/2016')

    DateDefaulter.format = '%Y/%m/%d'
    assert_equal(date.to_s, '2016/10/21')
  end

  def test_strftime
    date = Date.new(2016, 10, 21)

    DateDefaulter.format = '%d/%m/%Y'
    assert_equal(date.strftime, '21/10/2016')

    DateDefaulter.format = '%m/%d/%Y'
    assert_equal(date.strftime, '10/21/2016')

    DateDefaulter.format = '%Y/%m/%d'
    assert_equal(date.strftime, '2016/10/21')
  end

  def test_format=
    DateDefaulter.format = 'test'

    assert_equal(DateDefaulter.format, 'test')
  end

  def test_configuration
    assert_equal(DateDefaulter.configuration, DateDefaulter::Configuration.instance)
  end

  def test_setting_format_with_configuration
    DateDefaulter.configuration do |configuration|
      configuration.format = 'hello'
    end

    assert_equal(DateDefaulter.format, 'hello')
  end
end
