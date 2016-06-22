require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController

  get '/users/home' do
      if logged_in? && current_user_logged_in?
        @user = current_user
        erb :'/users/home'
      else
        redirect '/login'
      end
    end

  post '/users/home' do 
      @user = current_user
      @list = List.create(name: params[:list][:name])
      @user.lists << @list
      redirect '/users/home'
  end


end

#eric
#harper