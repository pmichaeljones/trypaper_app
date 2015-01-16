require 'sinatra'
require 'TryPaper'
require 'pry'

get '/' do
  haml :index
end

post '/' do
  verify_params(params)
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
  haml :index, locals: parse_api_reply(reply)
end


def parse_api_reply(reply)
  case reply.code
  when "201"
    {api_reply: "Document successfully sent to TryPaper. Check <a href='https://www.trypaper.com/Printroom/APIHistory' class='black-link'>API logs</a> for details."}
  else
    {bad_reply: "There's been a paper jam! Your document was not sent. Check <a href='https://www.trypaper.com/Printroom/APIHistory' class='black-link'>API logs</a> for details."}
  end
end

def verify_params(params)
  if params[:uploaded_file] == nil
    halt haml :index, locals: {bad_reply: "You must upload a document."}
  end
end






