ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
