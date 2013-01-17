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

      def click
        click = cast(Click.new(offer: @offer, target: @target, referrer: @referrer, offer_type: @offer_type), Offers::Statistics::Persistable)
        click.persist
        click
      end
    end
  end
end
