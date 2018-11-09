require_relative('label')

label = Label.new({'name' => 'Test_Label', 'location' => 'Earth'})

label.save
p Label.all
