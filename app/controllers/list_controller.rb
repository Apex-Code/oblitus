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
    if params[:name] == "" || params[:list_type] == ""
      redirect to "/list/new"
    else
    @list = List.create(name: params[:name], list_type: params[:list_type], user_id: params[current_user])
    @list.save
    current_user.lists << @list
      redirect to "/lists/#{@list.id}/add_items"
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
      redirect to "/lists/#{@list.id}"
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

  post '/lists/:id/add_items' do
    if logged_in?

      @list = List.find_by_id(params[:id])
      @item = Item.create(content: params[:content], list_id: params[@list])
      @item.save

      erb :'/list/show'
       else
      redirect to '/login'
    end
  end

end
