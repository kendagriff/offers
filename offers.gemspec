$:.push File.expand_path("../lib", __FILE__)
require 'offers/version'

Gem::Specification.new do |s|
  s.name        = 'offers'
  s.version     = Offers::VERSION
  s.date        = '2012-11-19'
  s.summary     = "Banzai Offers"
  s.description = "Banzai Offer functionality"
  s.authors     = ["Kendall Buchanan"]
  s.email       = 'kendall@teachbanzai.com'
  s.files       = ["lib/offers.rb"]
  s.homepage    = 'https://github.com/kendagriff/offers'
end
