require 'test_helper'

module Offers
  module Statistics
    module Persistable
    end

    class TrackingTest < ActiveSupport::TestCase
      setup do
        @offer = Offer.new
        @target = mock
      end

      test "create click" do
        referrer = '/this-long-url.html'
        Click.any_instance.expects(:persist).returns(true)
        click = Tracking.click(offer: @offer, target: @target, referrer: referrer, offer_type: 'headline', sponsor_reference: 'someone')
        assert click.is_a?(Offers::Statistics::Persistable)
        assert_equal @offer, click.offer
        assert_equal @target, click.target
        assert_equal referrer, click.referrer
        assert_equal 'headline', click.offer_type
        assert_equal 'someone', click.sponsor_reference
      end

      test "create impression" do
        referrer = '/this-long-url.html'
        Impression.any_instance.expects(:persist).returns(true)
        impression = Tracking.impress(offer: @offer, target: @target, referrer: referrer, offer_type: 'headline', sponsor_reference: 'someone')
        assert impression.is_a?(Offers::Statistics::Persistable)
        assert_equal @offer, impression.offer
        assert_equal @target, impression.target
        assert_equal referrer, impression.referrer
        assert_equal 'headline', impression.offer_type
        assert_equal 'someone', impression.sponsor_reference
      end
    end
  end
end
