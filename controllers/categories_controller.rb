require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require('pry-byebug')

get '/categories' do
    @categories = Category.all
    erb(:'categories/index')
end

get '/categories/new' do
    erb(:'categories/new')
end

post '/categories' do
  @category = Category.new( params )
  @category.save
  redirect to('/categories')
end

get '/categories/:id' do
 @category = Category.find( params[:id] )
 erb(:'categories/show')
end 
