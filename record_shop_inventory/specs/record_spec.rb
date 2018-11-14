require('minitest/autorun')
require('minitest/rg')

require_relative('../models/label')
require_relative('../models/record')

class RecordTest < MiniTest::Test

  def setup
    label = Label.new({'id' => '1', 'name' => 'Test_Label', 'location' => 'Earth' })
    @record = Record.new({'id' => '1', 'title' => 'Test_Record', 'artist_id' => '1', 'release_date' => '2018-11-09', 'stock_quantity' => '3', 'buying_cost' => '10', 'selling_price' => '15', 'label_id' => label.id})
  end

  def test_record_exists
    assert_equal(Record, @record.class)
  end

  def test_record_can_have_id
    assert_equal(1, @record.id)
  end

  def test_record_has_title
    assert_equal('Test_Record', @record.title)
  end

  def test_record_has_artist_id
    assert_equal(1, @record.artist_id)
  end

  def test_record_has_release_date
    assert_equal('2018-11-09', @record.release_date)
  end

  def test_record_has_stock_quantity
    assert_equal(3, @record.provide_stock_quantity)
  end

  def test_record_has_buying_cost
    assert_equal(10, @record.provide_buying_cost)
  end

  def test_record_has_selling_price
    assert_equal(15, @record.provide_selling_price)
  end

  def test_record_has_label_id
    assert_equal(1, @record.label_id)
  end

  def test_record_has_running_stock_total
    assert_equal(3, @record.running_stock_total)
  end

  def test_record_has_total_sold
    assert_equal(0, @record.total_sold)
  end

  def test_record_has_file
    assert_equal("", @record.file)
  end

  def test_record_markup
    assert_equal(5, @record.markup)
  end

end
