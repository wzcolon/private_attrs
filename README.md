# PrivateAttrs

[![Maintainability](https://api.codeclimate.com/v1/badges/09bf301b78287db6e51b/maintainability)](https://codeclimate.com/github/wzcolon/private_attrs/maintainability)

Adds a few to Ruby's Clss object to allow for private attr
readers/writers/accessors.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'private_attrs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install private_attrs

## Usage

Inside any class object you can now define private attr methods.

```
class Crocodile

  private_attr_reader :temper

  def intialize(temper)
    @temper = temper
  end
end

Crocodile.new('angry').temper # => NoMethodError "private method 'temper' called for ...
```

### Why

In short, because existing patterns to do this are ugly. This particular
pattern violates 'the scissor rule' of coding in that there is not a clear
separation between public and private methods.


```
class Crocodile

  private

  attr_reader :temper

  public

  attr_reader :asleep

  def initialize(temper)
    @temper = temper
  end

  def bites?
    if angry? && !asleep?
  end

  private

  def angry?
    temper == 'angry'
  end

  def asleep?
    current_time = Time.now
    (current_time.hour >= 17) and (current_time.hour <= 21)
  end
end
```

This use case is better but still not ideal as we want all of our attrs
methods definded at the top of any given class.

```
class Truck

  attr_reader :transmission_type
  attr_reader :weight

  def initialize(wheel_count:, transmission_type:, weight:)
    @wheel_count = wheel_count
    @transmission_type = transmission_type
    @weight =  weight
  end

  def oversized
    wheel_count > 4
  end

  def driver_must_shift?
    transmission_type == :manual
  end

  private

  attr_reader :wheel_count
end
```

Other patterns are even worse...
```
class Pet

  attr_accessor :species
  private :species
  private :species=

  attr_reader :hairy
  private :hairy

  def initialize(species, hairy)
    #...
  end
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
