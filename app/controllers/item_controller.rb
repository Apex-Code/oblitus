class ItemController < ApplicationController

  get '/items' do
      authenticate_user
      @lists = @current_user.lists
      redirect to '/home'
    end

    get '/items/new' do
      authenticate_user
      @lists = List.all
    if @list.user_id == current_user.id
      erb :'/items/new'
    else
      redirect_to '/items'
    end
  end

    post '/items/new' do
      if params[:list_id].nil? || params[:content].nil?
        redirect to '/items/new'
      else
        @list = List.find_by_id(params[:id])
      if @list.user_id == current_user.id
          Item.create(content: params[:content], list_id: params[:list_id])
      redirect '/items'
    else
      redirect_to '/items'
      end
    end
  end

    get '/items/new/:id' do
      authenticate_user
      @list = List.find_by_id(params[:id])
        if @list.user_id == current_user.id
         erb :'/items/just_added'
       else
         redirect_to '/items'
    end
  end

    post '/items/new/:id' do
      @list = List.find_by_id(params[:id])
      if @list.user_id == current_user.id
      Item.create(content: params[:content], list_id: params[@list.id])
      redirect '/items'
    else
      redirect_to '/items'
    end
  end

    get '/items/:id/edit' do
      @item = Item.find_by_id(params[:id])
      erb :'/items/edit'
    else
      redirect_to '/items'
     end

    patch '/items/:id' do
      @item = Item.find_by_id(params[:id])
      @item.content = params[:content]
      @item.save
      redirect '/items'
     end


    get '/items/:id/delete' do
      @item = Item.find_by_id(params[:id])
      erb :'/items/delete'
    end

    delete '/items/:id' do
      @item = Item.find_by_id(params[:id])
      @item.destroy
      redirect '/items'
    end

  end
