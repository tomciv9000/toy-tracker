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
    binding.pry
    if logged_in?
      if params[:name] == "" || !params[:stage_id]
        redirect to "/kids/new"
      else
        @kid = current_user.kids.build(params)
        if @kid.save
          redirect to "/kids/#{@kid.slug}"
        else
          redirect to "/kids/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get "/kids/:slug" do
    if logged_in?
      @kid = Kid.find_by_slug(params[:slug])
      erb :'kids/show'
    else
    redirect to '/login'
    end
  end



end
