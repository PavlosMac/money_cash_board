require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
require('pry-byebug')

get '/merchants' do
    @merchants = Merchant.all
    erb(:'merchants/index')
end

get '/merchants/new' do
    erb(:'merchants/new')
end

post '/merchants' do
  @merchant = Merchant.new( params )
  @merchant.save
  redirect to('/merchants')
end

get '/merchants/:id' do
 @merchant = Merchant.find( params[:id] )
 @merchant_total = @merchant.total( params[:id] )
 erb(:'merchants/show')
end 


delete '/merchants/:id' do
    Merchant.delete( params[:id] )
    redirect to('/merchants')
end

