$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "harmony_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "harmony_cms"
  s.version     = HarmonyCms::VERSION
  s.authors     = ["Sreekanth Martha"]
  s.email       = ["Sreekanth_Martha@intuit.com"]
  s.homepage    = "http://www.intuit.com"
  s.summary     = "Rails engine to hold harmony specific cms components"
  s.description = "This gems holds the templates and components specific to harmony. All application based on harmonys should have a dependency on this gem to make use of the harmony cms components in its pages."

  s.files = Dir["{app,config,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  #s.test_files = Dir["spec/**/*"]

  s.required_ruby_version = '>= 1.9.3'

  s.add_development_dependency "rails", "= 3.2.11"
  s.add_development_dependency 'less-rails', '~> 2.3.2'
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "brakeman"

  s.require_paths = ["lib"]
end
