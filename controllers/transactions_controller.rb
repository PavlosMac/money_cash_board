require('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')


get '/transactions' do
    @transactions = Transaction.all
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


