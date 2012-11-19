require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  test "new rule" do
    assert_not_nil Rule.new
  end

  # Roles
  
  test "age" do
    rule = Rule.new
    rule.extend AgeRule
    assert rule.respond_to?(:lower_age)
    assert rule.respond_to?(:upper_age)
  end
end
