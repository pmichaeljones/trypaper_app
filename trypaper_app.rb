require "sinatra"
require "sinatra/activerecord"
require "trypaper"

get '/' do
  haml :index
end

post '/upload_document' do
  @api_key = params[:api_key]
  @return_id = params[:return_address_id]
  @client = TryPaper::Mailer.new(@api_key, @return_id)
  @api_reply = "great job"
  haml :index
end

