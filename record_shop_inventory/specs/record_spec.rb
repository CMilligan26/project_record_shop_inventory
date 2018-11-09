require('minitest/autorun')
require('minitest/rg')

require_relative('../models/record')
require_relative('../models/label')

class RecordTest < MiniTest::Test

  def setup
    label = Label.new({'id' => '1', 'name' => 'Test_Label', 'location' => 'Earth' })
    @record = Record.new({'id' => '1', 'title' => 'Test_Record', 'artist' => 'Test_Artist', 'genre' => 'Test_Genre', 'description' => 'Test_Description', 'stock_quantity' => '3', 'buying_cost' => '10', 'selling_price' => '15', 'label_id' => label.id})
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

end
