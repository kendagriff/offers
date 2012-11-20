module Offers
  module Target
    def available_offers(offers)
      return @available_offers if @available_offers
      @available_offers ||= offers.select { |offer| Offers::Rules::MatchUserContext.call(self, offer.rules) }
    end
  end
end
