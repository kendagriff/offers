# Banzai Offers

## Installation

```
gem 'offers', git: 'git://github.com/kendagriff/offers.git'
```

## Usage

### Retrieving Offers

Implement your own `Offers::Repository`:

```
class Offers::Repository
  def self.find(user)
    # Write your own code for retrieving offers here...
  end
end
```
