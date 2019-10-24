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
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
     redirect to '/signup'
   else
     @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
     @user.save
     session[:user_id] = @user.id
     redirect to '/kids'
   end
  end

  get "/login" do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/kids'
    end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
		  redirect '/kids'
		else
		  redirect '/signup'
		end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/login"
    end
  end

  get "/users/:id" do
    if logged_in? && current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      erb :'users/show'
    else
      redirect "/login"
    end
  end


end
