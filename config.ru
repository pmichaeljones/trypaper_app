require 'rubygems'
require 'bundler'
Bundler.setup(:default)

require './trypaper_app'
run Sinatra::Application