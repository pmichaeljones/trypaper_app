require "sinatra"
require "sinatra/activerecord"
require "pry"

get '/' do
  haml :index
end

post '/upload_document' do
  binding.pry
end

