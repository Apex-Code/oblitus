class ListController < ApplicationController

  get '/lists' do
    if logged_in?
      @lists = current_user.lists.all
      erb :'list/lists'
    else
      redirect to '/login'
    end
  end

  get '/lists/new' do
    if logged_in?
      erb :'list/new'
    else
      redirect to '/login'
    end
  end

  post '/lists' do
    if params[:item] == ""
      redirect to "/list/new"
    else
    @list = List.new(item: params[:item], type: params[:type])
    @list.save
      redirect to "/list/#{@list.id}/add_items"
    end
  end

  get '/lists/:id' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      erb :'list/show'
    else
      redirect to '/login'
    end
  end

  get '/lists/:id/add_items' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      erb :'list/add_items'
    else
      redirect to '/login'
    end
  end

  get '/lists/:id/edit' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      if @list.user_id == current_user.id
       erb :'list/edit'
      else
        redirect to '/lists'
      end
    else
      redirect to '/login'
    end
  end

  patch '/lists/:id' do
    if params[:content] == ""
      redirect to "/lists/#{params[:id]}/edit"
    else
      @list = List.find_by_id(params[:id])
      @list.content = params[:content]
      @list.save
      redirect to "/tweets/#{@tweet.id}"
    end
  end

  delete '/lists/:id/delete' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      if @list.user_id == current_user.id
        @list.delete
        redirect to '/lists'
      else
        redirect to '/lists'
      end
    else
      redirect to '/login'
    end
  end

end
