require_relative 'test_helper'

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

    it 'should parse API key from params' do
      post '/upload_document', {:name => "Patrick", :return_address_id => "555_main_street", :api_key => "FAKEKEY"}
      @api_key.must_equal "FAKEKEY"
    end

    it 'should parse return address ID from params' do
      post '/upload_document', {:name => "Patrick", :return_address_id => "555_main_street", :api_key => "FAKEKEY"}
      @return_id.must_equal "555_main_street"
    end

    it 'should instantiate the trypaper api' do
      post '/upload_document', {:name => "Patrick", :return_address_id => "555_main_street", :api_key => "FAKEKEY"}
      @client.must_be_kind_of String
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
