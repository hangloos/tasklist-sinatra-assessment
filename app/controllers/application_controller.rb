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

  get '/login' do
    if !logged_in?
      erb :login
    else
      redirect '/users/:id/home'
    end
  end


  get '/users/:id/home' do
    if logged_in?
      erb :'/users/home'
    else
      redirect '/login'
    end
  end



  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
  end

end