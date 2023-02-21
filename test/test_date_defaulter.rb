require 'minitest/autorun'
require_relative '../lib/date_defaulter'

class DateDefaulterTest < Minitest::Test
  def test_to_s
    assert_equal(Date.new(2022).to_s, '01/01/2022')
  end
end
