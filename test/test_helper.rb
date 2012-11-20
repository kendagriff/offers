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
end
