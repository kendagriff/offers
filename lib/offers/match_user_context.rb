module Offers
  module Rules
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
end
