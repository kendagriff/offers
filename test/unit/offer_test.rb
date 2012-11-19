require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  include Offers

  test "new offer" do
    attrs = {
      headline: "Get $25 in a free checking account!",
      text: "Our credit union is the best.",
      link: "https://www.macu.com/personal/savings/",
    }
    offer = Offer.new(attrs)
    assert_not_nil offer.headline
    assert_not_nil offer.text
    assert_not_nil offer.link
  end
end
