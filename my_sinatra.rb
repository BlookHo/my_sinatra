require 'sinatra'

# 2-nd stage namespace
require 'sinatra/namespace'

# 3 stage - module run
require 'sinatra/base'

module MyAppModule  # 3 stage - module run
  class App < Sinatra::Base  # 3 stage - module run
    register Sinatra::Namespace   # 3 stage - module run

    # 1 main style
    get '/' do # Outside namespace
      'Hello My Sinatra - Easy and Wide world!'
    end

    # 4 stage Routes - redirect
    # get '/' do
    #   "This route is fired"
    #   redirect to('/hello/World')
    # end

    # 2 params
    get "/hello/:name" do # Outside namespace
      # соответствует "GET /hello/foo" и "GET /hello/bar",
      # где params['name'] 'foo' или 'bar'
      "Sinatra приветствует тебя, #{params[:name]}!"
    end

    # 4 stage Routes block var 3
    # get '/hello/:name' do |n|
    #   "Hello #{n}!"
    # end

    # 4 stage Routes REGEX 4
    # Находит "GET /meta/hello/world", "GET /hello/world/1234" и так далее
    # path after /hello/
    get %r{/hello/([\w]+)} do |c|
      "Hello, #{c}!"
    end

    # 4 stage Routes Mask 5
    get '/say/*/to/*' do
      # соответствует /say/hello/to/world
      params['splat'] # => ["hello", "world"]
    end

    # # 4 stage Routes Mask 6-7
    get '/download/*.*' do
      # соответствует /download/path/to/file.xml
      a = params['splat'][0]
      # b = ".#{params['splat'][1]}"
      b = params['splat'][1]
      [a, b]
      params['splat'].to_s # => ["path/to/file", "xml"]
    end

    # 4 stage Routes Mask 7-6
    # с параметрами блока:
    # get '/download/*.*' do |path, ext|
    #   [path, ext].to_s # => ["path/to/file", "xml"]
    # end

    # 4 stage Routes 8
    get '/jobs.?:format?' do
      # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
      'Да, работает этот маршрут!'
    end


    namespace '/api/v1' do # Inside namespace 2-nd stage namespace
      get "/*" do
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
    end

  end  # 3 stage - module run
end  # 3 stage - module run
