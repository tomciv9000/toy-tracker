class StagesController < ApplicationController

  get '/stages' do
    if logged_in?
      @stages = Stage.development_stages
      erb:'stages/index'
    else
      redirect to '/login'
    end
  end

  get "/stages/:id" do
    if logged_in?
      @stage = Stage.find(params[:id])
      erb :'stages/show'
    else
    redirect to '/login'
    end
  end

end
