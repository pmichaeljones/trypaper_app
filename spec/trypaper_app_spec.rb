require 'spec_helper'

describe 'TryPaper Web App' do

  def app
    Sinatra::Application
  end

  describe "GET '/'" do
    it 'should render index template' do
      get '/'
      expect(response).to render_tempate :view
    end

  end

  describe "POST '/upload_document'" do
    it 'should accept params'
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
