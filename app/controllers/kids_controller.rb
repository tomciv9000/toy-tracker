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
    @kid = Kid.find(params[:id])
    if current_user.kids.include?(@kid)
      erb :'kids/show'
    else
      flash[:errors] = "Not one of yours!"
      redirect to '/kids'
    end
  end

  get '/kids/:id/edit' do
    redirect_if_not_logged_in
    @kid = Kid.find(params[:id])
    if current_user.kids.include?(@kid)
      erb :'kids/edit'
    else
      flash[:errors] = "Not one of yours!"
      redirect to '/kids'
    end
  end

  patch '/kids/:id' do
    redirect_if_not_logged_in
    @kid = Kid.find(params[:id])
    if current_user.kids.include?(@kid)
      @kid.assign_attributes(params[:kid])
      if !@kid.valid?
        flash[:errors] = @kid.errors.full_messages
        redirect to "/kids/#{@kid.id}"
      else
        @kid .save
        flash[:message] = "Successfully updated kid"
        redirect to "/kids/#{@kid.id}"
      end
    else
      flash[:message] = "Not one of yours!"
      redirect to "/kids"
    end
  end

  delete '/kids/:id/delete' do
    redirect_if_not_logged_in
    @kid = Kid.find_by_id(params[:id])
    if current_user.kids.include?(@kid)
      @kid.delete
      flash[:message] = "Successfully deleted kid"
    else
      flash[:message] = "Not one of yours!"
      redirect to '/kids'
    end
  end

end
