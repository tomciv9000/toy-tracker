class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :view, 'app/views'
    enable :sessions
    set :session_secret, "toy_secret"
 end
  end

  get '/' do
    "Hello Moto."
  end

end
