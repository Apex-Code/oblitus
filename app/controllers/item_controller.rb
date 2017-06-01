class ItemController < ApplicationController

  get '/items' do
      redirect_if
      @lists = current_user.lists
      redirect to '/home'
    end


    get '/items/new' do
      redirect_if

      @lists = List.all
      erb :'/items/new'
    end


    post '/items/new' do
      if params[:list_id].nil? || params[:content].nil?
        redirect to '/items/new'
      else
      @list = List.find_by_id(params[:id])
    Item.create(content: params[:content], list_id: params[:list_id])
      redirect '/items'
      end
end
    get '/items/new/:id' do
      redirect_if
      @list = List.find_by_id(params[:id])
      erb :'/items/just_added'
    end

    post '/items/new/:id' do
      @list = List.find_by_id(params[:id])
      Item.create(content: params[:content], list_id: params[@list.id])
      redirect '/items'
    end

    get '/items/:id/edit' do
      @item = Item.find_by_id(params[:id])
      erb :'/items/edit'
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
