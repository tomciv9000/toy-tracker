require 'sinatra/base'
require 'rack-flash'
class StagesController < ApplicationController
use Rack::Flash
  get '/stages' do
    redirect_if_not_logged_in
      @stages = Stage.development_stages
      erb:'stages/index'
  end

  get "/stages/:id" do
    redirect_if_not_logged_in
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
  end

end
