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
    rule = Rule.new(lower_age: 6, upper_age: 12)
    assert !MatchUserByAgeContext.call(@user, rule)
  end

  test "do match user by age" do
    @user.age = 12
    rule = Rule.new(lower_age: 6, upper_age: 12)
    assert MatchUserByAgeContext.call(@user, rule)
  end

  test "match by teacher" do
    assert MatchTeacherContext.call(Teacher.new, Rule.new)
  end

  test "do not match by teacher" do
    assert !MatchTeacherContext.call(Student.new, Rule.new)
  end
end
