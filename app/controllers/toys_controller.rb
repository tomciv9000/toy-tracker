class ToysController < ApplicationController

  get '/toys' do
    redirect_if_not_logged_in
    erb:'toys/index'
  end

  get '/toys/new' do
    redirect_if_not_logged_in
    @categories = Category.list_categories
    @stages = Stage.development_stages
    erb :'/toys/new'
  end

  post '/toys' do
    redirect_if_not_logged_in
    @toy = Toy.new(params[:toy])
    if !@toy.valid?
      flash[:errors] = @toy.errors.full_messages
      redirect to "/toys/new"
    else
      @toy.save
      flash[:message] = "Successfully added toy."
      redirect to "/toys/#{@toy.id}"
    end
  end

  get '/toys/:id' do
    redirect_if_not_logged_in
    @toy = Toy.find_by_id(params[:id])
    redirect_if_not_user_owned(@toy)
    erb :'toys/show'
  end

  get '/toys/:id/edit' do
    redirect_if_not_logged_in
    @categories = Category.list_categories
    @stages = Stage.development_stages
    @toy = Toy.find_by_id(params[:id])
    redirect_if_not_user_owned(@toy)
    erb :'toys/edit'
  end

  patch '/toys/:id' do
    redirect_if_not_logged_in
    @toy = Toy.find_by_id(params[:id])
    redirect_if_not_user_owned(@toy)
    @toy.assign_attributes(params[:toy])
      if !@toy.valid?
        flash[:errors] = @toy.errors.full_messages
        redirect to "/toys/#{@toy.id}"
      else
        @toy.save
        flash[:message] = "Successfully updated toy"
        redirect to "/toys/#{@toy.id}"
      end
  end

  delete '/toys/:id/delete' do
    redirect_if_not_logged_in
    @toy = Toy.find_by_id(params[:id])
    redirect_if_not_user_owned(@toy)
    @toy.delete
    flash[:message] = "Successfully deleted toy"
    redirect to "/toys"
  end

  helpers do

    def redirect_if_not_user_owned(toy)
      if !current_user.toys.include?(toy)
        flash[:message] = "Toy not found!"
        redirect to "/toys"
      end
    end

  end


end
