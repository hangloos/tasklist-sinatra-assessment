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

  get '/lists' do 
    if logged_in? && current_user_logged_in?
      @user = current_user
      erb :'/lists/home'
    else
      redirect '/login'
    end
  end

  post '/lists/delete' do 
    @list = List.find_by_id(params[:list][:id])
    @list.delete
    redirect '/lists'
  end

  post '/lists/edit' do
    @list = List.find_by_id(params[:list][:id])
    @list.update(name: params[:list][:name])
    redirect '/lists'
  end




end

#eric
#harper
# list - 