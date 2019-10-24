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
      @user_kids_by_stage = []
      @user_toys_by_stage = []
      current_user.kids.each do |kid|
        if kid.stage = @stage
          @user_kids_by_stage << kid
        end
      end
      current_user.toys.each do |toy|
        if toy.stage = @stage
          @user_toys_by_stage << toy
        end
      end
      erb :'stages/show'
    else
    redirect to '/login'
    end
  end

end
