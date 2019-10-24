class KidsController < ApplicationController

  get '/kids' do
    if logged_in?
      erb:'kids/index'
    else
      redirect to '/login'
    end
  end

  get '/kids/new' do
    if logged_in?
      erb :'/kids/new'
    else
      erb :'/users/login'
    end
  end

  post '/kids' do
    if logged_in?
      if params[:name] == "" || !params[:stage_id]
        redirect to "/kids/new"
      else
        @kid = current_user.kids.build(params)
        if @kid.save
          redirect to "/kids/#{@kid.id}"
        else
          redirect to "/kids/new"
        end
      end
    else
      redirect to '/login'
    end
  end


  get "/kids/:id" do
    if logged_in?
      @kid = Kid.find(params[:id])
      erb :'kids/show'
    else
    redirect to '/login'
    end
  end

  get '/kids/:id/edit' do
    if logged_in?
      @kid = Kid.find(params[:id])
      erb :'kids/edit'
    else
      redirect to '/login'
    end
  end

  patch '/kids/:id' do
    if logged_in?
      @kid = Kid.find(params[:id])
      @kid.name = params[:name]
      @kid.stage_id = params[:stage_id]
      @kid.save
      redirect to "/kids/#{@kid.id}"
    else
      redirect to '/login'
    end
  end

  delete '/kids/:id/delete' do
    if logged_in?
      @kid = Kid.find_by_id(params[:id])
      if @kid && current_user.kids.include?(@kid)
        @kid.delete
      end
      redirect to '/kids'
    else
      redirect to '/login'
    end
  end



end
