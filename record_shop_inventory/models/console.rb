require_relative('label')
require_relative('record')

# Label.delete_all #tested
Record.delete_all #tested

label = Label.new({'name' => 'Test_Label', 'location' => 'Earth'})
# #
label.save #Tested
# # p Label.all #Tested
# # # label.name = "New Name" #Tested
# # # label.update #Tested
# # # p Label.all #Tested
# # label.delete #Tested
# # p Label.all #Tested
# p label.label #tested

record = Record.new({'title' => 'Test_Record', 'artist' => 'Test_Artist', 'genre' => 'Test_Genre', 'description' => 'Test_Description', 'stock_quantity' => '3', 'buying_cost' => '10', 'selling_price' => '15', 'label_id' => label.id})

record.save #Tested
# p Record.all #Tested
# record.title = "New Title" #Tested
# record.update #Tested
# p Record.all #Tested
# record.delete #Tested
# p Record.all #Tested
# p record.record #tested
