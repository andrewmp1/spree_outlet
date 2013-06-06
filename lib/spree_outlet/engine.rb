require File.expand_path('../handlebars/template.rb',  __FILE__)

module SpreeOutlet
  class Engine < ::Rails::Engine
    isolate_namespace SpreeOutlet
    # Why on gods earth did I have to do this? I want those X hours back!
    config.handlebars = ActiveSupport::OrderedOptions.new
    
    config.handlebars.templates_root = "spree_outlet/templates"
    config.handlebars.templates_path_separator = '/'

    config.before_initialize do |app|
      Sprockets::Engines #force autoloading
      Sprockets.register_engine '.handlebars', Handlebars::Template
      Sprockets.register_engine '.hbs', Handlebars::Template
    end
  end
end
