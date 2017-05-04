# require './my_sinatra'
#
# run Sinatra::Application

# 3 stage - module run
root = File.expand_path File.dirname(__FILE__)
require File.join( root , 'my_sinatra.rb' )

app = Rack::Builder.app do
  run TryOut::App
end

run app
