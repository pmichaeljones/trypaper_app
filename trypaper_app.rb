require "sinatra"
require "sinatra/activerecord"
require "trypaper"

get '/' do
  haml :index
end

post '/upload_document' do
  render :index
end

