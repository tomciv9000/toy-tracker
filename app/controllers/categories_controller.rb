class CategoriesController < ApplicationController

  get '/categories' do
    if logged_in?
      @categories = Category.list_categories
      erb:'categories/index'
    else
      redirect to '/login'
    end
  end

  get "/categories/:id" do
    if logged_in?
      @category = Kid.find(params[:id])
      erb :'kids/show'
    else
    redirect to '/login'
    end
  end

  get '/kids/:id/edit' do  #load edit form
      @kid = Kid.find(params[:id])
      erb :'kids/edit'
    end

  patch '/kids/:id' do #edit action
    @kid = Kid.find(params[:id])
    @kid.name = params[:name]
    @kid.stage_id = params[:stage_id]
    @kid.save
    redirect to "/kids/#{@kid.id}"
  end



end
