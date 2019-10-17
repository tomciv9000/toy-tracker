class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "toy_secret"
  end

  get '/' do
      erb :index
  end

    helpers do
      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find(session[:user_id])
      end

      def user_created_manufacturers
          user_created_manufacturers = []
          user = current_user
          user.kids.each do |kid|
            kid.toys.each {|toy| user_created_manufacturers << toy.manufacturer}
          end
          user_created_manufacturers.uniq
        end
    end
    


end
