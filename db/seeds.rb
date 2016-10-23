require('pry-byebug')
require_relative('../models/item')
require_relative('../models/merchant')
require_relative('../models/transaction')

Item.delete_all
Merchant.delete_all
Transaction.delete_all


@item1 = Item.new( {'description' => 'food', 'cost' => 30.00 } )
@item1.save
@item2 = Item.new( {'description' => 'electricity', 'cost' => 80.00 } )
@item2.save

@merchant1 = Merchant.new( {'name' => 'scottish power'} )
@merchant1.save
@merchant2 = Merchant.new( {'name' => 'tesco'} )
@merchant2.save

@transaction1 = Transaction.new( { 'merchant_id' => @merchant1.id, 'item_id' => @item2.id })
@transaction1.save
@transaction2 = Transaction.new( { 'merchant_id' => @merchant2.id, 'item_id' => @item1.id })
@transaction2.save


