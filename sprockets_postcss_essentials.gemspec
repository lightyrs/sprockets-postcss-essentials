# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprockets_postcss_essentials/version'

Gem::Specification.new do |spec|
  spec.name          = "sprockets_postcss_essentials"
  spec.version       = SprocketsPostcssEssentials::VERSION
  spec.authors       = ["Vasily Polovnyov"]
  spec.email         = ["vasily@polovnyov.ru"]
  spec.summary       = %q{Sprockets PostCSS extension with support for essential features}
  spec.description   = %q{Sprockets PostCSS extension with support for essential features like nesting, variables, @import, and mixins}
  spec.homepage      = "https://github.com/vast/sprockets-postcss-essentials"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
