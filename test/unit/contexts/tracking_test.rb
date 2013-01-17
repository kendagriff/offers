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
      Impression.any_instance.expects(:persist).returns(true)
      impression = Tracking.impress(offer: @offer, target: @target, referrer: referrer, offer_type: 'headline')
      assert impression.is_a?(Offers::Persistable)
      assert_equal @offer, impression.offer
      assert_equal @target, impression.target
      assert_equal referrer, impression.referrer
      assert_equal 'headline', impression.offer_type
    end
  end
end
