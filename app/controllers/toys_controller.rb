class ToysController < ApplicationController

  get '/toys/new' do
    if logged_in?
      @categories = Category.list_categories
      erb :'/toys/new'
    else
      erb :'/users/login'
    end
  end

  post '/toys' do
    @toy = Toy.create(params[:toy])
    if !params["manufacturer"]["name"].empty?
      @toy.manufacturer = Manufacturer.create(name: params["manufacturer"]["name"])
      @toy.save
    end
    redirect "/toys/#{@toy.id}"
  end

end
