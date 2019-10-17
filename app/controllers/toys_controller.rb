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
    binding.pry
    @toy = Toy.create(params[:toy])
    if !params["manufacturer"]["name"].empty?
      @toy.manufacturer = Manufacturer.create(name: params["manufacturer"]["name"])
      # When using the shovel operator, ActiveRecord instantly fires update SQL
      # without waiting for the save or update call on the parent object,
      # unless the parent object is a new record.
    end
    redirect "/toys/#{@toy.id}"
  end

end
