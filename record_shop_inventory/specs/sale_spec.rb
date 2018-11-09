require('minitest/autorun')
require('minitest/rg')

require_relative('../models/label')
require_relative('../models/record')
require_relative('../models/sale')

class SaleTest < MiniTest::Test

  def setup
    label = Label.new({'id' => '1', 'name' => 'Test_Label', 'location' => 'Earth' })
    record = Record.new({'id' => '1', 'title' => 'Test_Record', 'artist' => 'Test_Artist', 'genre' => 'Test_Genre', 'description' => 'Test_Description', 'stock_quantity' => '3', 'buying_cost' => '10', 'selling_price' => '15', 'label_id' => label.id})
    @sale = Sale.new({'id' => '1', 'record_id' => record.id, 'sale_quantity' => '2'})
  end

  def test_sale_exists
    assert_equal(Sale, @sale.class)
  end

  def test_sale_can_have_id
    assert_equal(1, @sale.id)
  end

  def test_sale_has_record_id
    assert_equal(1, @sale.provide_record_id)
  end

  def test_sale_has_sale_quantity
    assert_equal(2, @sale.provide_sale_quantity)
  end

end
