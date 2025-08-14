require 'enum-i18n/version'

# DEPRECATED: This gem is deprecated and will be archived on March 31, 2025.
# Consider using Rails built-in human_attribute_name or alternative gems like enum_help.
# See README.md for migration guide.
warn 'DEPRECATION WARNING: The enum-i18n gem is deprecated and will be archived on March 31, 2025. Consider migrating to Rails built-in alternatives or alternative gems.'

module EnumI18n
  extend ActiveSupport::Concern
  included do
    after_initialize :set_enum_text
  end

  def set_enum_text
    name = model_name.try(:i18n_key).to_s
    defined_enums.each do |enum|
      enum_column = enum.first
      class_eval <<-METHOD, __FILE__, __LINE__ + 1
        def #{enum_column}_text(scope=nil)
          scope ||= 'activerecord.enum.#{name}.#{enum_column}'
          I18n.t(#{enum_column}, scope: scope)
        end
      METHOD
    end
  end
end
