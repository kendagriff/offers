module Offers
  class Impression
    attr_accessor :offer, :target, :referrer

    def initialize(params={})
      params.each { |attr, value| self.public_send("#{attr}=", value) }
    end
  end
end
