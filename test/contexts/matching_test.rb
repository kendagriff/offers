require 'test_helper'

class MatchingTest < ActiveSupport::TestCase
  class User
    attr_accessor :age
  end

  class Teacher < User
    def teacher?; true end;
  end

  class Student < User
    def teacher?; false end;
  end

  setup do
    @user = User.new
  end

  test "do not match user by age" do
    @user.age = 13
    rule = Rule.new(lower_age: 6, upper_age: 12, rule_type: 'Age')
    assert !MatchUserContext.call(@user, rule)
  end

  test "do match user by age" do
    @user.age = 12
    rule = Rule.new(lower_age: 6, upper_age: 12, rule_type: 'Age')
    assert MatchUserContext.call(@user, rule)
  end

  test "match by teacher" do
    assert MatchUserContext.call(Teacher.new, Rule.new(rule_type: 'Teacher'))
  end

  test "do not match by teacher" do
    assert !MatchUserContext.call(Student.new, Rule.new(rule_type: 'Teacher'))
  end

  test "match by multiple rules" do
    user = Teacher.new
    user.age = 5
    rules = [
      Rule.new(rule_type: 'age', lower_age: 6, upper_age: 12),
      Rule.new(rule_type: 'teacher')
    ]
    assert MatchUserContext.call(user, rules)
  end
end
