require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  setup do
    @student = Student.new
    @student.age = 16
    @student.extend Target
  end
  
  test "return offers for user" do
    assert @student.offers.any?
  end

  test "return correct offer for sixteen year old" do
    assert_equal 1, @student.offers.length
    assert_equal 'My First Offer!', @student.offers.first.headline
  end
end
