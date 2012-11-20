module Offers
  class Offer
    attr_accessor :headline, :text, :link, :rules

    def initialize(params={})
      params.each { |attr, value| self.public_send("#{attr}=", value) }
    end
  end
end
