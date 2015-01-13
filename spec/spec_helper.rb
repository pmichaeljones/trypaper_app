ENV['RACK_ENV'] = 'test'
require './trypaper_app'
require 'minitest/autorun'
require 'rack/test'
require 'minitest/pride'

TEST_API_KEY = "TPTESTCF24A7D8095EDF88E3EFD6103C"
RETURN_ADDRESS_ID = "555_Main_Street_Fake_City"

include Rack::Test::Methods
