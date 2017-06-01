class ListController < ApplicationController

  get '/lists/:id/show' do
  @list = List.find_by_id(params[:id])
  erb :'/lists/show'
end

  get '/lists/new' do
    redirect_if
    erb :'/lists/new'
  end

  post '/lists/new' do
    list = current_user.lists.create(name: params[:name])
    item = list.items.create(content: params[:item][:content])
    redirect '/items'
  end

  get '/lists/:id/edit' do
    redirect_if
    @list = List.find_by_id(params[:id])
    erb :'/lists/edit'
  end

  patch '/lists/:id' do
    @list = List.find_by_id(params[:id])
    @list.name = params[:name]
    @list.save
    redirect '/items'
  end

  get '/lists/:id/delete' do
    @list = List.find_by_id(params[:id])
    erb :'/lists/delete'
  end

  delete '/lists/:id' do
    @list = List.find_by_id(params[:id])
    @list.destroy
    redirect '/items'
  end

end
