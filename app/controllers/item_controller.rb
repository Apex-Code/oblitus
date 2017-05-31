class ItemController < ApplicationController

  get '/items' do
      redirect_if
      @lists = current_user.lists
      erb :'/item/show'
    end

    get '/items/new' do
      redirect_if
      @user = current_user
      @lists = List.all
      erb :'/item/new'
    end

    post '/items/new' do
      item.create(content: params[:content], list_id: params[:list_id])
      redirect '/items'
      end

    get '/items/new/:id' do
      redirect_if
      @list = List.find_by_id(params[:id])
      erb :'/items/just_added'
    end

    post '/items/new/:id' do
      @list = List.find_by_id(params[:id])
      item.create(content: params[:name], list_id: params[@list.id])
      redirect '/items'
    end

    get '/items/:id/edit' do
      @item = Item.find_by_id(params[:id])
      erb :'/item/edit'
    end

    patch '/items/:id' do
      @item = Item.find_by_id(params[:id])
      @item.name = params[:name]
      @item.save
      redirect '/items'
    end


    get '/item/:id/delete' do
      @item = Item.find_by_id(params[:id])
      erb :'/item/delete'
    end

    delete '/items/:id' do
      @item = Item.find_by_id(params[:id])
      @item.destroy
      redirect '/items'
    end

  end
