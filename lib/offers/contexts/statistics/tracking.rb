require 'perspective/context'

module Offers
  module Statistics
    class Tracking < Perspective::Context
      actors :offer, :target, :referrer, :offer_type

      def impress
        impression = cast(Impression.new(offer: @offer, target: @target, referrer: @referrer, offer_type: @offer_type), Offers::Statistics::Persistable)
        impression.persist
        impression
      end
    end
  end
end
