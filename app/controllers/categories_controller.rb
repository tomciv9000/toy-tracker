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
      @category = Category.find(params[:id])
      erb :'categories/show'
    else
    redirect to '/login'
    end
  end


end
