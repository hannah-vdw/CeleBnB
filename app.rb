require 'sinatra/base'
require 'pg'
require_relative './lib/property'

class Celebnb < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/properties' do
    @properties = Property.all
    erb :properties
  end

  get '/properties/new' do
    erb :new
  end

  post '/properties' do
    Property.add(name: params[:name], description: params[:description], price: params[:price])
    redirect '/properties'
  end
  
  run! if app_file == $0
end
