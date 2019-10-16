class ToysController < ApplicationController

  get '/toys/new' do
    if logged_in?
      @toys = Toy.all
      @toy_types = Type.create_these_types
      erb :'/toys/new'
    else
      erb :'/users/login'
    end
  end

end
