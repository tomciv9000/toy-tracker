class ToysController < ApplicationController

  get '/toys/new' do
    if logged_in?
      @categories = Category.list_categories
      erb :'/toys/new'
    else
      erb :'/users/login'
    end
  end

end
