require "sinatra"
require "sinatra/activerecord"
require "trypaper"

get '/' do
  haml :index
end

post '/upload_document' do
  binding.pry
  @api_reply = "great job"
  haml :index
end

