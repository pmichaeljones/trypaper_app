require_relative 'spec_helper'

describe 'TryPaper Web App' do

  def app
    Sinatra::Application
  end

  describe "GET '/'" do
    it 'responds successfully' do
      get '/'
      last_response.status.must_equal 200
    end

    it 'renders index template' do
      get '/'
      last_response.body.must_include "TryPaper.com PDF Mailing App"
    end

  end

  describe "POST '/upload_document'" do

    it 'should accept params' do
      post '/upload_document'
    end

    it 'should verify existence of name'
    it 'should verify existence of address1'
    it 'should verify existence of city'
    it 'should verify existence of state'
    it 'should verify existence of zipcode'
    it 'should convert upload_file to Base64'
    it 'should post to TryPaper API'
    it 'should render index template with human-readable status from API response'
  end


end
