require File.expand_path('../../lib/offers', __FILE__)
require 'turn'
require 'pry'
require 'active_support/test_case'

class ActiveSupport::TestCase
  include Offers
  include Offers::Rules

  Turn.config.format = :dot

  class User
    attr_accessor :id, :age
  end

  class Teacher < User
    def teacher?; true end;
  end

  class Student < User
    def teacher?; false end;
  end

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
end
