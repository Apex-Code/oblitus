class UserController < ApplicationController


  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect to '/home'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
      else
      @user = User.create(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/home'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/signin'
    else
      erb :'/users/user_home'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :'users/user_home'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/home' do
    if logged_in?
    erb :'users/user_home'
  else
    erb :'/login'
      end
    end
  end
