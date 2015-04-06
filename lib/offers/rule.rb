module Offers
  module Rules
    class Rule
      attr_accessor :lower_age, :upper_age, :rule_type, :zips

      def initialize(params={})
        params.each do |attr, value|
          self.public_send("#{attr}=", value) 
        end
      end
    end

    # Roles

    module AgeRule
      def match(user)
        user.age && user.age >= self.lower_age && user.age <= self.upper_age
      end
    end

    module TeacherRule
      def match(teacher)
        teacher.teacher?
      end
    end

    module TeacherZipsRule
      def match(student)
        self.zips.split(',').include? student.teacher_zip
      end
    end
  end
end
