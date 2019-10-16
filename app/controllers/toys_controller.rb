class ToysController < ApplicationController

  get '/toys/new' do
    if logged_in?
      @toys = Toy.all
      erb :'/toys/new'
    else
      erb :'/users/login'
    end
  end

end
