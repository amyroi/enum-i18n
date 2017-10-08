# EnumI18n

Enum attributes with I18n and ActiveRecord support

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enum_i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enum_i18n

## Usage

ActiveRecord:

```ruby
class ApplicationRecord < ActiveRecord::Base
  include EnumI18n
end
```

Or:
```ruby
class User < ApplicationRecord
  include EnumI18n
end
```


I18n:

```ruby
---
en:
  activerecord:
    enum:
      user:
        sex:
          male: "Male"
          female: "Female"
```

get attribute value:

```ruby
@user.sex_text
```

or can appoint i18n scope

```ruby
@user.sex_text('user.sex')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amyroi/enum_i18n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
