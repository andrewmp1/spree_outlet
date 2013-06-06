Teabag.setup do |config|

  config.root = SpreeOutlet::Engine.root
  config.asset_paths << SpreeOutlet::Engine.root.join('test/dummy/test/javascripts')

end if defined?(Teabag) && Teabag.respond_to?(:setup) # let Teabag be undefined outside of development/test/asset groups

Rails.application.assets.each_file {|p| puts p }