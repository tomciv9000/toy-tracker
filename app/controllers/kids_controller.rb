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

#########  instead of just a slug - i need a slug + id to deal with duplicate names

  get "/kids/:id" do
    if logged_in?
      @kid = Kid.find(params[:id])
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
