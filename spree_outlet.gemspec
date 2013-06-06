$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree_outlet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spree_outlet"
  s.version     = SpreeOutlet::VERSION
  s.authors     = ["Drew Purdy"]
  s.email       = ["andrewmp1@gmail.com"]
  s.homepage    = "http://github.com/andrewmp1"
  s.summary     = "A Spree Front end store created in Ember JS to work with Spree 2.x"
  s.description = "A Spree Front end store created in Ember JS to work with Spree 2.x"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "jquery-rails"
  s.add_dependency "barber"
  s.add_dependency "spree", ">= 2.0.0"

  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'teabag'
end
