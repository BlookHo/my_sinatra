require 'sinatra'

# 2-nd stage namespace
require 'sinatra/namespace'

# 3 stage - module run
require 'sinatra/base'

module TryOut  # 3 stage - module run
  class App < Sinatra::Base  # 3 stage - module run
    register Sinatra::Namespace   # 3 stage - module run

    get '/' do
      'Hello My Sinatra - Easy and Wide world!'
    end

    get "/hello/:name" do
      "Sinatra приветствует тебя, #{params[:name]}!"
    end

    namespace '/api/v1' do  # 2-nd stage namespace
      get "/*" do
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
    end

  end  # 3 stage - module run
end  # 3 stage - module run
