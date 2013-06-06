#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SpreeOutlet'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'



Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end


task :default => :test

desc "Run the javascript specs"
task :teabag => "app:teabag"

namespace :teabag do
  desc "Builds Teabag into the distribution ready bundle"
  task :build => "build:javascripts"

  namespace :build do

    desc "Compile coffeescripts into javacripts"
    task :javascripts => :environment do
      env = Rails.application.assets

      %w(spree_outlet).each do |path|
        asset = env.find_asset(path)
        asset.write_to(Teabag::Engine.root.join("app/assets/javascripts/#{path.gsub(/\//, "-")}"))
      end
    end
  end
end
