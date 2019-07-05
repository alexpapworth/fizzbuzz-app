require 'test_helper'

class NumberTest < ActiveSupport::TestCase
  test "should save number with blank fizzbuzz result" do
    number = Number.new( id: 111, result: "" )
    assert number.save, "Couldn't save the number with a blank result"
  end
end
