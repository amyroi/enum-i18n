# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "enum-i18n/version"

Gem::Specification.new do |spec|
  spec.name          = "enum-i18n"
  spec.version       = EnumI18n::VERSION
  spec.authors       = ["amyroi"]
  spec.email         = ["atsuko.mori.200@gmail.com"]

  spec.summary       = 'Enum attributes with I18n and ActiveRecord support'
  spec.description   = 'Enum attributes with I18n and ActiveRecord support'
  spec.homepage      = 'https://github.com/amyroi/enum-i18n'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", ">= 4.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
