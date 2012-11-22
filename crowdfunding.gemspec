$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "crowdfunding/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "crowdfunding"
  s.version     = Crowdfunding::VERSION
  s.authors     = ["Jack Dean Watson-Hamblin"]
  s.email       = ["info@fluffyjack.com"]
  s.homepage    = "http://www.fluffyjack.com/"
  s.summary     = "Instantly add simple crowdfunding to your Ruby on Rails application with PayPal Payments Standard."
  s.description = "Instantly add simple crowdfunding to your Ruby on Rails application with PayPal Payments Standard."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "money"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "webrat"
end
