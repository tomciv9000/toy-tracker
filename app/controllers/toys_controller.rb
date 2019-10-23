class ToysController < ApplicationController

  get '/toys' do
    if logged_in?
      erb:'toys/index'
    else
      redirect to '/login'
    end
  end

  get '/toys/new' do
    if logged_in?
      @categories = Category.list_categories
      @stages = Stage.development_stages
      erb :'/toys/new'
    else
      erb :'/users/login'
    end
  end


  post '/toys' do
    if logged_in?
      if params[:toy][:name] == "" || !params[:toy][:stage_id] || !params[:toy][:kid_id]
        redirect to "/toys/new"
      else
        @toy = Toy.new(params[:toy])
        if @toy.save
          redirect to "/toys/#{@toy.id}"
        else
          redirect to "/toys/new"
        end
      end
    else
      redirect to '/login'
    end
  end




  get '/toys/:id' do
     @toy = Toy.find(params[:id])
     erb :'toys/show'
   end

end
