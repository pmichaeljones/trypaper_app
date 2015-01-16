require 'sinatra'
require 'TryPaper'
require 'pry'

get '/' do
  haml :index
end

post '/' do
  api_key = params[:api_key]
  return_id = params[:return_address_id]
  @tags = []

  # Build tags array to pass into client. Single printing is default, so it's skipped if chosen
  unless params[:quantity] == "Single"
    @tags << params[:quantity]
  end

  # Adding optional print tags into the tags array
  params[:optional_tags].each { |t| @tags << t } if params[:optional_tags]

  client = TryPaper::Mailer.new(api_key, return_id, @tags)
  file = File.read(params[:uploaded_file][:tempfile])
  doc = TryPaper::Document.new(file)
  recipient = TryPaper::Recipient.new(params[:name], params[:address1], params[:address2], params[:city], params[:state], params[:zipcode])
  client.document = doc
  client.recipient = recipient
  reply = client.submit
  binding.pry
  haml :index, locals: {api_reply: parse_api_reply(reply)}
end


def parse_api_reply(reply)
  case reply.code
  when "201"
    "Document successfully sent to TryPaper. Check API logs for details."
  else
    "There was an error sending document to TryPaper. Check API logs for details."
  end
end


