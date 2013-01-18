module Offers
  class TrackingEvent
    attr_accessor :offer, :target, :referrer, :offer_type, :event_type

    def initialize(params={})
      params.each { |attr, value| self.public_send("#{attr}=", value) }
    end
  end
end
