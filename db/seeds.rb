require('pry-byebug')
require_relative('../models/item')
require_relative('../models/merchant')
require_relative('../models/transaction')

Item.delete_all
Merchant.delete_all
Transaction.delete_all


@item1 = Item.new( {'description' => 'food'} )
@item1.save
@item2 = Item.new( {'description' => 'electricity'} )
@item2.save
@item3 = Item.new( {'description' => 'wood'} )
@item3.save
@item4 = Item.new( {'description' => 'clothes'} )
@item4.save
@item5 = Item.new( {'description' => 'beer'} )
@item5.save
@item6 = Item.new( {'description' => 'rent'} )
@item6.save


@merchant1 = Merchant.new( {'name' => 'scottish power'} )
@merchant1.save
@merchant2 = Merchant.new( {'name' => 'tesco'} )
@merchant2.save
@merchant3 = Merchant.new( {'name' => 'tk max'} )
@merchant3.save
@merchant4 = Merchant.new( {'name' => 'forestry commision'} )
@merchant4.save
@merchant5 = Merchant.new( {'name' => 'white horse bar'} )
@merchant5.save
@merchant6 = Merchant.new( {'name' => 'sainsburies'} )
@merchant6.save




# @transaction1 = Transaction.new( { 'merchant_id' => @merchant1.id, 'item_id' => @item2.id })
# @transaction1.save
# @transaction2 = Transaction.new( { 'merchant_id' => @merchant2.id, 'item_id' => @item1.id })
# @transaction2.save


