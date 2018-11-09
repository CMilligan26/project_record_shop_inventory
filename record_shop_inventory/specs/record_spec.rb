require('minitest/autorun')
require('minitest/rg')

require_relative('../models/record')
require_relative('../models/label')

class RecordTest < MiniTest::Test

  def setup
    label = Label.new({'id' => '1', 'name' => 'Test_Label', 'location' => 'Earth' })
    record = record.new({'id' => '1', 'title' => 'Test_Record', 'artist' => 'Test_Artist', 'genre' => 'Test_Genre', 'description' => 'Test_Description', 'stock_quantity' => '3', 'buying_cost' => '10', 'selling_price' => '15', 'label_id' => label.id})
  end

def record_exists

end

end
