require './trypaper_app'
require 'rspec'
require 'rack/test'

TEST_API_KEY = "TPTESTCF24A7D8095EDF88E3EFD6103C"
RETURN_ADDRESS_ID = "555_Main_Street_Fake_City"

ENV['RACK_ENV'] = 'test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end