require('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')


get '/transactions' do
    @transactions = Transaction.all
    @total = Transaction.total
    erb(:'transactions/index')
end

get '/transactions/new' do
    @merchants = Merchant.all
    @categories = Category.all
    erb(:'transactions/new')
end

post '/transactions' do
    @transaction = Transaction.new( params )
    @transaction.save
    redirect to('/transactions')
end


get '/transactions/:id' do
    @transaction = Transaction.find( params[:id] )
    erb(:'transactions/show')
end


get '/transactions/:id/edit' do
  @transaction = Transaction.find( params[:id] )
    erb(:'transactions/edit')
end


put '/transactions/:id' do
  @transaction = Transaction.update( params )
  redirect to("/transactions")
end


delete '/transactions/:id' do
    Transaction.delete( params[:id] )
    redirect to('/transactions')
end






