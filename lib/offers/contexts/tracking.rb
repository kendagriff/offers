require 'perspective/context'

module Offers
  class Tracking < Perspective::Context
    actors :offer, :target, :referrer, :offer_type

    def impress
      impression = cast(Impression.new(offer: @offer, target: @target, referrer: @referrer, offer_type: @offer_type), Offers::Impressions::Persistable)
      impression.persist ? impression : false
    end
  end
end
