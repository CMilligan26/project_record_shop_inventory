require('minitest/autorun')
require('minitest/rg')

require_relative('../models/label')

class LabelTest < MiniTest::Test

def setup
  label = Label.new({'name' => 'Test_Label', 'Location' => 'Earth'})
end

end
