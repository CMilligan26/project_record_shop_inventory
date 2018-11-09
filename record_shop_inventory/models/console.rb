require_relative('label')

# Label.delete_all #tested

label = Label.new({'name' => 'Test_Label', 'location' => 'Earth'})
# #
# label.save #Tested
# # p Label.all #Tested
# # # label.name = "New Name" #Tested
# # # label.update #Tested
# # # p Label.all #Tested
# # label.delete #Tested
# # p Label.all #Tested
# p label.label #tested
