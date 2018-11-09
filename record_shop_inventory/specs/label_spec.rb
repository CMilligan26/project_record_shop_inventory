require('minitest/autorun')
require('minitest/rg')

require_relative('../models/label')

class LabelTest < MiniTest::Test

def setup
  @label = Label.new({'id' => '1', 'name' => 'Test_Label', 'location' => 'Earth'})
end

def test_label_exists
  assert_equal(Label, @label.class)
end

def test_label_can_have_id
  assert_equal(1, @label.id)
end

def test_label_has_name
  assert_equal('Test_Label', @label.name)
end

def test_label_has_location
  assert_equal('Earth', @label.location)
end

end
