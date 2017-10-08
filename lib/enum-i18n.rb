require "enum-i18n/version"

module EnumI18n
  extend ActiveSupport::Concern
  included do
    after_initialize :set_enum_text
  end

  def set_enum_text
    name = model_name.try(:i18n_key).to_s
    defined_enums.each do |enum|
      enum_column = enum.first
      class_eval <<-METHOD
        def #{enum_column}_text(scope=nil)
          scope ||= 'activerecord.enum.#{name}.#{enum_column}'
          I18n.t(#{enum_column}, scope: scope)
        end
      METHOD
    end
  end
end
