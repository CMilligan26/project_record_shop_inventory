require_relative('label')
require_relative('record')
require_relative('sale')
require_relative('artist')
require_relative('genre')
require_relative('genre_categorization')

Label.delete_all #tested
Record.delete_all #tested
Sale.delete_all #tested
Artist.delete_all #tested
Genre.delete_all #tested
GenreCategorization.delete_all #tested

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

artist = Artist.new({'artist_name' => 'Test_Artist'})
# #
artist.save #Tested
# p Artist.all #Tested
# artist.artist_name = "New Name" #Tested
# artist.update #Tested
# p Artist.all #Tested
# # artist.delete #Tested
# p Artist.all #Tested

record = Record.new({'title' => 'Test_Record', 'artist_id' => artist.id, 'release_date' => '1999-01-01', 'stock_quantity' => '3', 'buying_cost' => '10', 'selling_price' => '15', 'label_id' => label.id})

record.save #Tested
# p Record.all #Tested
# record.title = "New Title" #Tested
# record.update #Tested
# p Record.all #Tested
# record.delete #Tested
# p Record.all #Tested
# p record.record #tested

sale = Sale.new({'record_id' => record.id, 'sale_quantity' => '2'})

# sale2 = Sale.new({'record_id' => record.id, 'sale_quantity' => '50'})
sale.save #Tested
# sale2.save #Tested
# p Sale.all #Tested
# sale.sale_quantity = '4' #Tested
# sale.update #Tested
# p Sale.all #Tested
# sale.delete #Tested
# p Sale.all #Tested
# p sale.sale #tested

# p sale2.record_buying_cost #tested
# p sale.record_selling_price #tested
# p sale.record_markup #tested
# p sale.record_profit #tested
# p Sale.total_record_buying_cost #tested
# p Sale.total_record_selling_price #tested
# p Sale.total_record_mark_up #tested
# p Sale.total_profit #tested

genre = Genre.new({'genre_name' => 'Test_Genre'})
# #
genre.save #Tested
# p Genre.all #Tested
# genre.genre_name = "New Name" #Tested
# genre.update #Tested
# p Genre.all #Tested
# # genre.delete #Tested
# p Genre.all #Tested

genre_categorization = GenreCategorization.new({'record_id' => record.id, 'genre_id' => genre.id})
# #
genre_categorization.save #Tested
# p GenreCategorization.all #Tested
# genre_categorization.update #Tested
# p GenreCategorization.all #Tested
# # genre_categorization.delete #Tested
# p GenreCategorization.all #Tested
