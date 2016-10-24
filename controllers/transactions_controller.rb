require('pry-byebug')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/merchant')


get '/transactions' do
    @transactions = Transaction.all
    erb(:'transactions/index')
end

get '/transactions/new' do
    @transactions = Transaction.all
    @merchants = Merchant.all
    @categories = Category.all
    erb(:'transactions/new')
end


