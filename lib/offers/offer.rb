module Offers
  # Data

  class Offer
    attr_accessor :headline, :text, :link

    def initialize(params={})
      params.each { |attr, value| self.public_send("#{attr}=", value) }
    end
  end

  module Rules
    class Rule
      attr_accessor :lower_age, :upper_age, :rule_type

      def initialize(params={})
        params.each do |attr, value|
          self.public_send("#{attr}=", value) 
        end
      end
    end

    # class NullRule
    #   def lower_age; 0;    end
    #   def upper_age; 0;    end
    #   def rule_type; '';   end
    #   def teacher?; false; end
    # end

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
  end

  # Contexts

  class MatchUserContext
    def self.call(user, rules)
      new(user, rules).call
    end

    def initialize(user, rules)
      @user = user
      @rules = [rules].flatten
      @rules.each do |rule|
        rule_object = Kernel.const_get("Offers")
          .const_get("Rules")
          .const_get("#{rule.rule_type.capitalize}Rule")
        rule.extend rule_object
      end
    end

    def call
      @rules.detect { |rule| rule.match(@user) } || false
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
