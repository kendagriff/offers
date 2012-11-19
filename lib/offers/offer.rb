module Offers
  # Data

  class Offer
    attr_accessor :headline, :text, :link, :sponsor

    def initialize(params={})
      params.each { |attr, value| self.public_send("#{attr}=", value) }
    end
  end

  class Rule
    attr_accessor :lower_age, :upper_age

    def initialize(params={})
      params.each { |attr, value| self.public_send("#{attr}=", value) }
    end
  end

  # Roles
  
  module AgeRule
    def match(user)
      user.age >= self.lower_age && user.age <= self.upper_age
    end
  end

  module TeacherRule
    def match(user)
      user.teacher?
    end
  end

  # Contexts

  class MatchUserContext
    def self.call(user, rule)
      new(user, rule).call
    end

    def initialize(user, rule)
      @user, @rule = user, rule
    end

    def call
      @rule.match(@user)
    end
  end

  class MatchUserByAgeContext < MatchUserContext
    def initialize(user, rule)
      super
      @rule.extend AgeRule
    end
  end

  class MatchTeacherContext < MatchUserContext
    def initialize(user, rule)
      super
      @rule.extend TeacherRule
    end
  end
end
