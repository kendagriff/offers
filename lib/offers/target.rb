module Offers
  module Target
    def offers
      return @offers if @offers
      available = Repository.find(self)
      @offers ||= available.select { |offer| Offers::Rules::MatchUserContext.call(self, offer.rules) }
    end
  end
end
