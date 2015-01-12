require "sinatra"
require "sinatra/activerecord"
require "pry"

get '/' do
  haml :index
end

