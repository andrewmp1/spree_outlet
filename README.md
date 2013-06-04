# SpreeOutlet

A Spree front end store created in Ember JS to work with Spree 2.x

# Motiviation

I wanted to show an example of creating a spree front end that is completely
 contained in its own rails engine and can be mounted (sideloaded?) on an existing spree store w/o any change to the current front end.  My goal is to just parody the current minimal spree front end.  Of course there is much much more you
 can do w/ having your store in js/ember like using websockets for realtime inventory and a lot more rich animations.  However, I wanted to keep this very simple and implement the barebones of products, cart, checkout, and user authentication.  You can fork this to create more interesting projects.  Spree flash sale site anyone?

# Caution

Super Alpha Gamma Radiation Emitting Rails Engine.  Will Destroy All Your Base in Production...

# Y U No Use Ember-Data ?

Unfortunately after trying for quite I while I realized it will probably be easier to fork spree_api and make it jsonapi.org
compliant rather than digging deep into the internals and creating a custom
adapter. I didn't go completely custom on ember-model. I used ebryn's ember-model.  If your interested in going down that rabbit hole checkout branch ember-data.

# Setup

Create a new rails application and setup Spree (See spreecommerce documentation)

Add spree_outlet to your Gemfile

Include this in your routes.rb file to mount the spree_outlet store before spree

Example:

 "mount SpreeOutlet::Engine, :at => '/outlet/' "

# Example store setup step by step:

<pre><code>
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
</code></pre>

Add spree_outlet mount point to routes.rb.  Example:

- "mount SpreeOutlet::Engine, :at => '/outlet/' "

# License

This project rocks and uses MIT-LICENSE.