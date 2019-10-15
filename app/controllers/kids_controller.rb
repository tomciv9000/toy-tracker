class KidsController < ApplicationController

  get '/kids' do
    if logged_in?
      @kids = Kids.all
      erb :'kids/kids'
    else
      redirect to '/login'
    end
  end
