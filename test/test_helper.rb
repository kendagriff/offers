require File.expand_path('../../lib/offers', __FILE__)
require 'turn'
require 'pry'
require 'active_support/test_case'

class ActiveSupport::TestCase
  include Offers
  Turn.config.format = :dot
end
