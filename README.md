# EnumI18n

⚠️ **DEPRECATED: This gem is deprecated and will be archived soon.** ⚠️

## Why Deprecated?

This gem was created to provide I18n support for ActiveRecord enums, but Rails now has better built-in alternatives:

- **Rails 7.1+**: Use `human_attribute_name` with enum values
- **Alternative gems**: Consider using `enum_help` or `enumerize` which are more actively maintained

## Migration Guide

### Before (with enum-i18n):
```ruby
class User < ApplicationRecord
  include EnumI18n
  enum :status, [:active, :inactive]
end

# Usage
@user.status_text # => "Active"
```

### After (Rails 7.1+):
```ruby
class User < ApplicationRecord
  enum :status, [:active, :inactive]
end

# Usage
User.human_attribute_name("status.#{@user.status}") # => "Active"
```

### Alternative gems:
- **enum_help**: `gem 'enum_help'` - More actively maintained
- **enumerize**: `gem 'enumerize'` - Feature-rich enum management

## Archive Date
**This gem will be archived on or after August 31, 2025.**

---

Enum attributes with I18n and ActiveRecord support

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enum-i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enum-i18n

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

Bug reports and pull requests are welcome on GitHub at https://github.com/amyroi/enum-i18n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
