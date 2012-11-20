require 'test_helper'

class TargetTest < ActiveSupport::TestCase
  class Offers::Repository
    def self.find(user)
      [
        Offers::Offer.new(
          headline: 'My First Offer!',
          text: 'My offer body',
          link: 'http://www.google.com/',
          rules: [
            Offers::Rules::Rule.new(lower_age: 13, upper_age: 18, rule_type: 'age')
          ]
        ),
        Offers::Offer.new(
          headline: 'My Second Offer!',
          text: 'My offer body',
          link: 'http://www.facebook.com/',
          rules: [
            Offers::Rules::Rule.new(rule_type: 'teacher')
          ]
        )
      ]
    end
  end

  setup do
    @student = Student.new
    @student.age = 16
    @student.extend Target
    @offers = Offers::Repository.find(@student)
  end
  
  test "return correct offer for sixteen year old" do
    available_offers = @student.available_offers(@offers)
    assert_equal 1, available_offers.length
    assert_equal 'My First Offer!', available_offers.first.headline
  end
end
