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
    current_user.lists << @list

    @list.items << Item.create(content: params[:item_1])
    @list.items << Item.create(content: params[:item_2])
    @list.items << Item.create(content: params[:item_3])
    @list.items << Item.create(content: params[:item_4])
    @list.items << Item.create(content: params[:item_5])
    @list.items << Item.create(content: params[:item_6])
    @list.items << Item.create(content: params[:item_7])
    @list.items << Item.create(content: params[:item_8])
    @list.items << Item.create(content: params[:item_9])
    @list.items << Item.create(content: params[:item_10])

  @list.save
      redirect to "/lists/#{@list.id}"
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
