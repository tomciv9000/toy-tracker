require 'sinatra/base'
require 'rack-flash'

class CategoriesController < ApplicationController
  use Rack::Flash

  get '/categories' do
    redirect_if_not_logged_in
      @categories = Category.list_categories
      erb:'categories/index'
  end

  get "/categories/:id" do
    redirect_if_not_logged_in
      @category = Category.find(params[:id])
      @user_toys_by_category = []
      current_user.toys.each do |toy|
        if toy.category_ids.include?(@category.id)
          @user_toys_by_category << toy
        end
      end
      erb :'categories/show'
  end

end
