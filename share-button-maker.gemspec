# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "share_button_maker/version"

Gem::Specification.new do |s|
  s.name        = "share-button-maker"
  s.version     = ShareButtonMaker::VERSION
  s.authors     = ["beezwax"]
  s.email       = ["info@beezax.net"]
  s.homepage    = "http://github.com/beezax/share-button-maker"
  s.summary     = %q{Easily add share buttons to your website.}
  s.description = %q{Easily add share buttons to your website.}
  s.license     = 'MIT'

  s.files         = Dir.glob('lib/**/*') + %w(README.md CHANGELOG.md MIT-LICENSE)
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.files        = Dir.glob("{bin,lib,config,app/assets/javascripts,app/assets/stylesheets,app/assets/images}/**/*")
  s.files       += %w(README.md CHANGELOG.md)
  s.add_development_dependency "rails"
  s.add_runtime_dependency "coffee-rails"
end
