require 'perspective/context'

module Offers
  class Tracking < Perspective::Context
    actors :offer, :target, :referrer

    def impress
      impression = cast(Impression.new(offer: @offer, target: @target, referrer: @referrer), Persistable)
      impression.persist
      impression
    end
  end
end
