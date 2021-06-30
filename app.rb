require 'sinatra/base'
require 'pg'
require_relative './lib/property'
require_relative './lib/user'

class Celebnb < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :'sessions/signup'
  end

  post '/users' do
    @user = User.signup(username: params[:username], email: params[:email], password: params[:password])
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/properties' do
    @properties = Property.all
    erb :properties
  end

  post '/properties/:id' do
    Property.book(params[:id])
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
