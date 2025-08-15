# Changelog

## [DEPRECATED]

⚠️ **This gem is deprecated and will be archived on or after August 31, 2025.** ⚠️

### Why Deprecated?
- Rails 7.1+ provides better built-in alternatives using `human_attribute_name`
- Alternative gems like `enum_help` and `enumerize` are more actively maintained
- Consider migrating to Rails built-in solutions or alternative gems

### Migration Path
- **Rails 7.1+**: Use `User.human_attribute_name("status.#{@user.status}")`
- **Alternative gems**: Consider `enum_help` or `enumerize`

---

# CHANGELOG

# v0.2.1
* Update contact information to use GitHub issues instead of email addresses
* Remove email addresses from gemspec and documentation
* Add bug tracker and source code URIs to gemspec metadata
* Update .gitignore to exclude gem files

# v0.2.0
* Mark gem as deprecated
* Add deprecation warning to gemspec and README
* Set archive date to August 31, 2025
* Update documentation with migration guide

# v0.1.1
[full changelog]( https://github.com/amyroi/enum-i18n/compare/v0.1.0...v0.1.1)

* Changed license
* Add CHANGELOG

# v0.1.0
* first release
