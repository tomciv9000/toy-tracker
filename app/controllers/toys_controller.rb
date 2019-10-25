require 'sinatra/base'
require 'rack-flash'
class ToysController < ApplicationController
  use Rack::Flash

  get '/toys' do
    redirect_if_not_logged_in
    erb:'toys/index'
  end

  get '/toys/new' do
    redirect_if_not_logged_in
    @categories = Category.list_categories
    @stages = Stage.development_stages
    erb :'/toys/new'
  end


  post '/toys' do
    redirect_if_not_logged_in
    @toy = Toy.new(params[:toy])
    if !@toy.valid?
      flash[:errors] = @toy.errors.full_messages
      redirect to "/toys/new"
    else
      @toy.save
      flash[:message] = "Successfully added toy."
      redirect to "/toys/#{@toy.id}"
    end
  end

  get '/toys/:id' do
    redirect_if_not_logged_in
    @toy = Toy.find(params[:id])
    erb :'toys/show'
  end

  patch '/toys/:id' do
    redirect_if_not_logged_in
    @toy = Toy.find(params[:id])
    if @toy && current_user.toys.include?(@toy)
      @toy.assign_attributes(params[:toy])
      if !@toy.valid?
        flash[:errors] = @toy.errors.full_messages
        redirect to "/toys/#{@toy.id}"
      else
        @toy.save
        flash[:message] = "Successfully updated toy"
        redirect to "/toys/#{@toy.id}"
      end
    else
      flash[:message] = "You do not have access to that toy."
      redirect to "/toys"
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
