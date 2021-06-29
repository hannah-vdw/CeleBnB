require 'sinatra/base'

class Celebnb < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/properties' do
    erb :'properties/list'
  end

  post '/properties' do
    "Goncalo's mansion A very nice place 1000"
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  run! if app_file == $0
end
