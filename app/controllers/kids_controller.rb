class KidsController < ApplicationController

  get '/kids' do
    if logged_in?
      @kids = Kid.all
      erb :'kids/index'
    else
      redirect to '/login'
    end
  end

  get '/kids/new' do
    if logged_in?
      erb :'/kids/new'
    else
      erb :'/users/login'
    end
  end

end
