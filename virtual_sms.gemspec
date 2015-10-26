$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "virtual_sms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "virtual_sms"
  s.version     = VirtualSms::VERSION
  s.authors     = ["Chen Yi-Cyuan"]
  s.email       = ["emn178@gmail.com"]
  s.homepage    = "https://github.com/emn178/virtual_sms"
  s.summary     = "An rails plugin that provides a virtual SMS box and SMS Carrier delivery method."
  s.description = "An rails plugin that provides a virtual SMS box and SMS Carrier delivery method."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md", "CHANGELOG.md"]

  s.add_dependency "rails", ">= 4.2.0"
  s.add_dependency "sms_carrier"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "coveralls"
end
