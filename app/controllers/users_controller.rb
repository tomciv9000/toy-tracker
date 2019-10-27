require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to '/kids'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if !@user.valid?
      flash[:errors] = @user.errors.full_messages
      redirect to 'signup'
    else
     @user.save
     flash[:message] = "Successfully created your account!"
     session[:user_id] = @user.id
     redirect to '/kids'
    end
  end

  get '/login' do
      flash[:message] = params[:error]
      if !session[:user_id]
        erb :'users/login'
      else
        redirect '/bags'
      end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
		  redirect '/kids'
		else
      flash[:message] = "Unable to log in with those credentials."
		  redirect '/signup'
		end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "Succesfully Logged Out"
      redirect '/login'
    else
      redirect '/'
    end
  end


  get '/users/:id' do
    if logged_in? && current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      erb :'users/show'
    else
      redirect '/login'
    end
  end




end
