require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "terrible_password"
  end

  get '/' do
    erb :index
  end

  get '/about' do
   erb :about
  end

 get '/contact' do
  erb :contact
 end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def authenticate_user
    if !logged_in?
      redirect to '/login'
    end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end


  end
end
