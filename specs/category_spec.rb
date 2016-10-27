require('minitest/autorun')
require('minitest/rg')
require_relative('../models/category')

class TestCategory < MiniTest::Test

  def setup
      options = { 'description' => 'food',
              'cost' => 20.00
    }

    @category = Category.new(options)
  end

  def test_item_has_description
    assert_equal('food', @category.description)
  end



end