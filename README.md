# Banzai Offers

## Installation

```
gem 'offers', git: 'git://github.com/kendagriff/offers.git'
```

## Usage

### Retrieving avaible offers

Pull your offers from a database (or API, or whatever):

```
offers = OfferRepository.find(user)
```

Find available offers using the Target role:

```
user.extend Offers::Target
user.available_offers(offers) # => [Offers::Offer...]
```

The returned offers will find each offer available to the user according to the criteria defined in the offers' `Rule` objects and the user's attributes.
