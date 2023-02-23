require 'minitest/autorun'
require_relative '../lib/date_defaulter'

class DateDefaulterTest < Minitest::Test
  def test_to_s
    DateDefaulter.configuration.format = '%d/%m/%Y'

    assert_equal(Date.new(2022).to_s, '01/01/2022')
  end

  def test_stftime
    DateDefaulter.configuration.format = '%d/%m/%Y'

    assert_equal(Date.new(2022).strftime, '01/01/2022')
  end
end
