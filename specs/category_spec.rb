require('minitest/autorun')
require('minitest/rg')
require_relative('../models/item')

class TestItem < MiniTest::Test

  def setup
      options = { 'description' => 'food',
              'cost' => 20.00
    }

    @item = Item.new(options)
  end

  def test_item_has_description
    assert_equal('food', @item.description)
  end

  def test_item_has_cost
    assert_equal(20.00, @item.cost)
  end

end