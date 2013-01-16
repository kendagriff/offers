require 'test_helper'

module Offers
  module Persistable
  end

  class TrackingTest < ActiveSupport::TestCase
    setup do
      @offer = Offer.new
      @target = mock
    end

    test "create impression" do
      referrer = '/this-long-url.html'
      Impression.any_instance.expects(:persist)
      impression = Tracking.impress(offer: @offer, target: @target, referrer: referrer)
      assert impression.is_a?(Persistable)
      assert_equal @offer, impression.offer
      assert_equal @target, impression.target
      assert_equal referrer, impression.referrer
    end
  end
end
