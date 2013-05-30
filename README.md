# SpreeOutlet

A Spree Front end store created in Ember JS to work with Spree 2.x

# Caution

Super Alpha Gamma Radiation Emitting Rails Engine.  Will Destroy All Your Base in Production...

# Setup

Create a new rails application and setup Spree (See spreecommerce documentation)

Add spree_outlet to your Gemfile

Include this in your routes.rb file to mount the spree_outlet store before spree

Example:

 "mount SpreeOutlet::Engine, :at => '/outlet/' "

# Example store setup step by step:

$gem install rails -v 3.2.13
$gem install spree
$rails _3.2.13_ new my_store
Add spree & spree_auth_devise & spree_outlet to Gemfile (pull from git repos)
$cd my_store && bundle
$ rails g spree:install --migrate=false --sample=false --seed=false
$ bundle exec rake spree_auth:install:migrations
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
$ bundle exec rake spree_sample:load
Add spree_outlet mount point to routes.rb.  Example:
"mount SpreeOutlet::Engine, :at => '/outlet/' "


# License

This project rocks and uses MIT-LICENSE.