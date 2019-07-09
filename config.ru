require './app'
require 'bundler'
require 'sprockets'

Bundler.require

map '/assets' do
    environment = Sprockets::Environment.new
    environment.append_path 'assets/stylesheets'
    environment.css_compressor = :scss
    run environment
end

map '/' do
    run Sinatra::Application
end
