require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  
  configure do
    enable :sessions
    use Rack::Flash
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    if logged_in? && current_user_logged_in?
      redirect '/users/home'
    else 
      erb :index
    end
  end

  get '/signup' do
    if !logged_in?
      erb :signup
    else
      redirect '/users/home'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    erb :'/users/home'
  end

  get '/login' do
    if !logged_in?
      erb :login
    else
      redirect '/users/home'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if !logged_in? && @user && @user.authenticate(params[:user][:passowrd])
      session[:user_id] = @user.id
      redirect '/users/home'
    else
      flash[:message] = "Sorry, we don't recognize your login information. Try again!!!"
      redirect '/'
    end
  end

  get '/logout' do 
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def current_user_logged_in?
      current_user.id == session[:user_id]
    end
  end

end