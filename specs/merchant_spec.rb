require('minitest/autorun')
require('minitest/rg')
require_relative('../models/merchant')

class TestMerchant < MiniTest::Test

  def setup
      options = { 'name' => 'oddbins'
      }

    @merchant = Merchant.new(options)
  end

  def test_merchant_has_name
    assert_equal('oddbins', @merchant.name)
  end

 

end