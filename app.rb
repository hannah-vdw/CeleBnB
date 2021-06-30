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

  post '/properties/:id' do
    Property.book params[:id]
  end

  run! if app_file == $0
end
