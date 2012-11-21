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

Implement your own `Offers::Target` module and override the `offers` method to return offers from a custom location:

```
module User
  module Target
    include Offers::Target

    def offers
      [... my offers go here]
    end
  end
end
```

The `available_offers` method will take the results of `offers` and match the right offers to the `User`, or whatever other object you inject.
