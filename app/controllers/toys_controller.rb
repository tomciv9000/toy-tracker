require 'sinatra/base'
require 'rack-flash'
class ToysController < ApplicationController
  use Rack::Flash

  get '/toys' do
    if logged_in?
      erb:'toys/index'
    else
      redirect to '/login'
    end
  end

  get '/toys/new' do
    if logged_in?
      @categories = Category.list_categories
      @stages = Stage.development_stages
      erb :'/toys/new'
    else
      erb :'/users/login'
    end
  end


  post '/toys' do
    if logged_in?
      if params[:toy][:name] == "" || !params[:toy][:stage_id] || !params[:toy][:kid_id]
        redirect to "/toys/new"
      else
        @toy = Toy.new(params[:toy])
        if @toy.save
          flash[:message] = "Successfully added toy."
          redirect to "/toys/#{@toy.id}"
        else
          redirect to "/toys/new"
        end
      end
    else
      redirect to '/login'
    end
  end


  get '/toys/:id' do
    if logged_in?
      @toy = Toy.find(params[:id])
      erb :'toys/show'
    else
      redirect to '/login'
    end
  end

  patch '/toys/:id' do
    if logged_in?
      @toy = Toy.find(params[:id])
      if @toy && current_user.toys.include?(@toy)
        @toy.name = params[:name]
        @toy.stage_id = params[:stage_id]
        @toy.kid_id = params[:kid_id]
        @toy.save
        redirect to "/toys/#{@toy.id}"
      else
        redirect to "/toys"
      end
    else
      redirect to '/login'
    end
  end

  delete '/toys/:id/delete' do
    if logged_in?
      @toy = Toy.find_by_id(params[:id])
      if @toy && current_user.toys.include?(@toy)
        @toy.delete
        redirect to "/toys"
      else
        redirect to "/toys"
      end
    else
      redirect to '/login'
    end
  end


end
