# Hstorable

This gem simplifies working wih fields stored using Hstore

## How to use

To use hstorable you should add this line to your Gemfile:

```
gem 'hstorable', '~> 0.0.5'
```

Note, this gem depends on hsore extension of PostgreSQL. So, you should create this extension in your db:

```SQL
CREATE EXTENSION hstore;
```

It is pertty easy to use HStorable with STI in RoR. First of all you shoud create table like this:

```ruby
create_table :wrappers do |t|
  t.hstore :properties, default: '', null: false
  t.string :type, null: false
  t.timestamps
end
```

That's all. Now you can use hstorable to solve your problems.

```ruby

class Api::Wrapper < ActiveRecord::Base
  include Hstorable
end

class Api::OneApiWrapper < Api::Wrapper
  hstore_simple :properties, name: 'consumer_key'
  hstore_simple :properties, name: 'consumer_secret'
  hstore_simple :properties, name: 'api_version', default: '26.0'
  hstore_simple :properties, name: 'code', readonly: true
  hstore_simple :properties, name: 'access_token', readonly: true
  hstore_simple :properties, name: 'refresh_token', readonly: true
  hstore_simple :properties, name: 'instance_url', readonly: true
  hstore_simple :properties, name: 'state', readonly: true, default: 'created'
end

class Api::AnotherApiWrapper < Api::Wrapper
  hstore_simple :properties, name: 'user_name'
  hstore_simple :properties, name: 'secret'
end
```

Different types of models with different set of fields will be stored in one table. And you can use it as ordinary model's properties.

```ruby
api = Api::OneApiWrapper.new(consumer_key: '743b57c3120b49b42588011066411d98', consumer_secret: '743b57c3120b49b42588011066411d98')
api.consumer_key # => '743b57c3120b49b42588011066411d98'
api.consumer_secret # => '743b57c3120b49b42588011066411d98'
api.save
api.update cosumer_key: '2afc9269f7ceb78533d6a2e2d72a14f9'
```

Cool, isn't?

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
