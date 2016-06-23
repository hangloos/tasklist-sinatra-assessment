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

  get '/users/:slug' do
  if logged_in? && current_user_logged_in?
      @user = current_user
      @list = List.find_by_slug(params[:slug])
      erb :'/tasks/home'
    else
      redirect '/login'
    end 
  end

  post '/users/tasks' do 
    @list = List.find_by_id(params[:list][:id])
    @task = Task.create(name: params[:task][:name])
    @list.tasks << @task
    redirect "/users/#{@list.slug}"
  end

  post '/users/tasks/delete' do
    @list = List.find_by_id(params[:list][:id])
    @task = Task.find_by_id(params[:task][:id])
    @task.delete
    redirect "/users/#{@list.slug}"
  end




end

# testing info:
#user1
#1