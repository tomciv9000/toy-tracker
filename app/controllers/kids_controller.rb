class KidsController < ApplicationController

  get '/kids' do
    redirect_if_not_logged_in
    erb:'kids/index'
  end

  get '/kids/new' do
    redirect_if_not_logged_in
    erb :'/kids/new'
  end

  post '/kids' do
    redirect_if_not_logged_in
    @kid = current_user.kids.build(params[:kid])
    if !@kid.valid?
      flash[:errors] = @kid.errors.full_messages
      redirect to "/kids/new"
    else
      @kid.save
      flash[:message] = "Succesfully added kid!"
      redirect to "/kids/#{@kid.id}"
    end
  end

  get "/kids/:id" do
    redirect_if_not_logged_in
    @kid = Kid.find_by_id(params[:id])
    redirect_if_not_users_kid(@kid)
    erb :'kids/show'
  end

  get '/kids/:id/edit' do
    redirect_if_not_logged_in
    @kid = Kid.find_by_id(params[:id])
    redirect_if_not_users_kid(@kid)
    erb :'kids/edit'
  end

  patch '/kids/:id' do
    redirect_if_not_logged_in
    @kid = Kid.find_by_id(params[:id])
    redirect_if_not_users_kid(@kid)
    @kid.assign_attributes(params[:kid])
      if !@kid.valid?
        flash[:errors] = @kid.errors.full_messages
        redirect to "/kids/#{@kid.id}"
      else
        @kid.save
        flash[:message] = "Successfully updated kid"
        redirect to "/kids/#{@kid.id}"
      end
  end

  delete '/kids/:id/delete' do
    redirect_if_not_logged_in
    @kid = Kid.find_by_id(params[:id])
    redirect_if_not_users_kid(@kid)
    @kid.delete
    flash[:message] = "Successfully deleted kid"
  end

  helpers do

    def redirect_if_not_users_kid(kid)
      if !current_user.kids.include?(kid)
        flash[:message] = "Kid not found!"
        redirect to "/kids"
      end
    end

  end

end
