# Deprecation Notice

## ⚠️ This gem is deprecated and will be archived on or after August 31, 2025 ⚠️

## Why is this gem deprecated?

The `enum-i18n` gem was created to provide I18n support for ActiveRecord enums when Rails didn't have built-in alternatives. However, the Rails ecosystem has evolved, and there are now better solutions available.

## What are the alternatives?

### 1. Rails Built-in (Recommended for Rails 7.1+)

Rails 7.1+ provides the `human_attribute_name` method which can handle enum values:

```ruby
class User < ApplicationRecord
  enum :status, [:active, :inactive, :pending]
end

# In your locale files (config/locales/en.yml)
en:
  activerecord:
    attributes:
      user:
        statuses:
          active: "Active"
          inactive: "Inactive"
          pending: "Pending"

# Usage
User.human_attribute_name("statuses.#{@user.status}")
# => "Active" (if @user.status is :active)
```

### 2. Alternative Gems

#### enum_help
```ruby
gem 'enum_help'

# Provides similar functionality with more features
@user.status_text # => "Active"
```

#### enumerize
```ruby
gem 'enumerize'

# More feature-rich enum management
enumerize :status, in: [:active, :inactive, :pending]
@user.status.text # => "Active"
```

## Migration Timeline

- **August 31, 2025 or later**: Gem will be archived and removed from RubyGems

## How to migrate

1. **Remove the gem** from your Gemfile
2. **Choose an alternative** from the options above
3. **Update your code** to use the new method
4. **Update your locale files** if necessary

## Need help?

If you need assistance with migration, please:
1. Check the README.md for detailed examples
2. Consider opening an issue for migration support
3. Review the alternative gem documentation

## Thank you

Thank you for using `enum-i18n`. We hope this gem served you well, and we encourage you to migrate to the more modern alternatives available today.

## Archive Date
**This gem will be archived on or after August 31, 2025.**
