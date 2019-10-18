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
          redirect to "/kids/#{@kid.slug_id}"
        else
          redirect to "/kids/new"
        end
      end
    else
      redirect to '/login'
    end
  end

#########  instead of just a slug - i need a slug + id to deal with duplicate names

  get "/kids/:slug_id" do
    if logged_in?
      @kid = Kid.find_by_slug_id(params[:slug_id])
      erb :'kids/show'
    else
    redirect to '/login'
    end
  end



end
