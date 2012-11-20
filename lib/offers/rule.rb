module Offers
  module Rules
    class Rule
      attr_accessor :lower_age, :upper_age, :rule_type

      def initialize(params={})
        params.each do |attr, value|
          self.public_send("#{attr}=", value) 
        end
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
  end
end
