require 'test_helper'

class RulesTest < ActiveSupport::TestCase
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

  test "match by teacher zip code" do
    teacher = mock
    teacher.stubs(:teacher_zip).returns('84032')
    rule = Rule.new(rule_type: 'teacher-zips', zips: "94822,84032")
    assert MatchUserContext.call(teacher, [rule])
  end

  test "do not match by teacher zip code" do
    teacher = mock
    teacher.stubs(:teacher_zip).returns('84032')
    rule = Rule.new(rule_type: 'teacher-zips', zips: "93282,23212")
    assert_equal false, MatchUserContext.call(teacher, [rule])
  end
end
