# Hstorable

This gem simplifies working wih fields stored using Hstore

## How to use

It is pertty easy to use HStorable with STI in RoR:

```ruby

class Api::BaseWrapper < ActiveRecord::Base
  extend Hstorable
end

class Api::OneApiWrapper < Api::BaseWrapper
  hstore_simple :properties, name: 'consumer_key'
  hstore_simple :properties, name: 'consumer_secret'
  hstore_simple :properties, name: 'api_version', default: '26.0'
  hstore_simple :properties, name: 'code', readonly: true
  hstore_simple :properties, name: 'access_token', readonly: true
  hstore_simple :properties, name: 'refresh_token', readonly: true
  hstore_simple :properties, name: 'instance_url', readonly: true
  hstore_simple :properties, name: 'state', readonly: true, default: 'created'
end

class Api::AnotherApiWrapper < Api::BaseWrapper
  hstore_simple :properties, name: 'user_name'
  hstore_simple :properties, name: 'secret'
end
```

Different types of models with different set of fields will be stored in one table.

## Installation

Add this line to your application's Gemfile:

    gem 'hstorable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hstorable


## Contributing

1. Fork it ( http://github.com/kimrgrey/hstorable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2014 Sergey Tsvetkov

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
