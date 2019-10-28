
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
    @toy = Toy.find(params[:id])
    if current_user.toys.include?(@toy)
      erb :'toys/show'
    else
      flash[:errors] = "Can't find that toy!"
      redirect to '/toys'
    end
  end

  get '/toys/:id/edit' do
    redirect_if_not_logged_in
    @categories = Category.list_categories
    @stages = Stage.development_stages
    @toy = Toy.find(params[:id])
    if current_user.toys.include?(@toy)
      erb :'toys/edit'
    else
      flash[:errors] = "Can't find that toy!"
      redirect to '/toys'
    end
  end

  patch '/toys/:id' do
    redirect_if_not_logged_in
    @toy = Toy.find(params[:id])
    if current_user.toys.include?(@toy)
      @toy.assign_attributes(params[:toy])
      if !@toy.valid?
        flash[:errors] = @toy.errors.full_messages
        redirect to "/toys/#{@toy.id}"
      else
        @toy.save
        flash[:message] = "Successfully updated toy"
        redirect to "/toys/#{@toy.id}"
      end
    else
      flash[:message] = "You do not have access to that toy."
      redirect to "/toys"
    end
  end

  delete '/toys/:id/delete' do
    redirect_if_not_logged_in
    @toy = Toy.find_by_id(params[:id])
    if current_user.toys.include?(@toy)
      @toy.delete
      flash[:message] = "Successfully deleted toy"
      redirect to "/toys"
    else
      flash[:message] = "You do not have access to that toy."
      redirect to "/toys"
    end
  end


end
