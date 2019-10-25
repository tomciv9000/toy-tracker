require 'sinatra/base'
require 'rack-flash'

class KidsController < ApplicationController
  use Rack::Flash

  get '/kids' do
    redirect_if_not_logged_in
      erb:'kids/index'
  end

  get '/kids/new' do
    redirect_if_not_logged_in
      erb :'/kids/new'
  end

  post '/kids' do
    redirect_if_not_logged_in
    @kid = current_user.kids.build(params[:kid])
    if !@kid.valid?
      flash[:errors] = @kid.errors.full_messages
      redirect to "/kids/new"
    else
      @kid.save
      flash[:message] = "Succesfully added kid!"
      redirect to "/kids/#{@kid.id}"
    end
  end


  get "/kids/:id" do
    if logged_in?
      @kid = Kid.find(params[:id])
      erb :'kids/show'
    else
    redirect to '/login'
    end
  end

  get '/kids/:id/edit' do
    if logged_in?
      @kid = Kid.find(params[:id])
      erb :'kids/edit'
    else
      redirect to '/login'
    end
  end

  patch '/kids/:id' do
    if logged_in?
      @kid = Kid.find(params[:id])
      @kid.name = params[:name]
      @kid.stage_id = params[:stage_id]
      @kid.save
      redirect to "/kids/#{@kid.id}"
    else
      redirect to '/login'
    end
  end

  delete '/kids/:id/delete' do
    if logged_in?
      @kid = Kid.find_by_id(params[:id])
      if @kid && current_user.kids.include?(@kid)
        @kid.delete
      end
      redirect to '/kids'
    else
      redirect to '/login'
    end
  end



end
