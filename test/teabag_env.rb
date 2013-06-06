# This file allows you to override various Teabag configuration directives when running from the command line. It is not
# required from within the Rails environment, so overriding directives that have been defined within the initializer
# is not possible.
#
# Set RAILS_ROOT and load the environment.
ENV["RAILS_ROOT"] = File.expand_path("../dummy", __FILE__)
require File.expand_path("../dummy/config/environment", __FILE__)

Teabag.setup do |config|
  config.root = SpreeOutlet::Engine.root
end
