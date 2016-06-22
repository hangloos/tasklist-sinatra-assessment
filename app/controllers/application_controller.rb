require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index
  end

  get '/signup' do
    if !logged_in?
      erb :signup
    else
      redirect '/users/:id/home'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect '/user/#{@user.id}/home'
  end

  get '/login' do
    if !logged_in?
      erb :login
    else
      redirect '/users/:id/home'
    end
  end


  get '/users/:id/home' do
    @user = current_user
    if logged_in? && current_user_logged_in?
      erb :'/users/home'
    else
      redirect '/login'
    end
  end


  get '/logout' do 
    if logged_in?
      session.clear
      redirect '/login'
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