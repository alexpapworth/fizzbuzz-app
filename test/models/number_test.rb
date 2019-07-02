require 'test_helper'

class NumberTest < ActiveSupport::TestCase
  test "should not save number without fizzbuzz result" do
    number = Number.new
  	assert_not number.save, "Saved the number without a fizzbuzz result"
  end
end
