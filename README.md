followable
==========

Followable adds following feature to any ActiveRecord object using Redis.  
Inspired by http://jimneath.org/2011/03/24/using-redis-with-ruby-on-rails.html.

## Installation

Add this line to your application's Gemfile:

    gem 'followable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install followable

## Usage

class User < ActiveRecord::Base
  include Followable
end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
