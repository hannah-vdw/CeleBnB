require 'sinatra/base'
require 'pg'
require_relative './lib/property'
require_relative './lib/user'

class Celebnb < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    erb :'sessions/signup'
  end

  post '/users' do
    @user = User.signup(username: params[:username], email: params[:email], password: params[:password])
    session[:username] = params[:username]
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    @username = session[:username]
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.signin(username: params[:username], password: params[:password])
    session[:signed_in_user] = user.username
    redirect '/properties'
  end

  get '/properties' do
    @properties = Property.all
    @signed_in_user = session[:signed_in_user]
    erb :'properties/list'
  end

  post '/properties/:id' do
    Property.book(id: params[:id], booking_date: params[:booking_date])
    redirect '/requests'
  end

  get '/properties/new' do
    erb :'properties/new'
  end

  get '/properties/:id' do
    @id = params[:id]
    erb :'bookings/book'
  end

  post '/properties' do
    Property.add(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_until: params[:available_until])
    redirect '/properties'
  end

  get '/requests' do
    @signed_in_user = session[:signed_in_user]
    erb :'bookings/requests'
  end
  
  run! if app_file == $0
end
