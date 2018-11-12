require_relative('../models/label')
require_relative('../models/record')
require_relative('../models/sale')

Label.delete_all
Record.delete_all
Sale.delete_all

#LABELS

label1 = Label.new({'name' => 'Warp', 'location' => 'London'})

label2 = Label.new({'name' => 'XL Recordings', 'location' => 'London'})

label3 = Label.new({'name' => 'Circa', 'location' => 'London'})

label4 = Label.new({'name' => 'Ninja Tune', 'location' => 'London'})

label5 = Label.new({'name' => 'Modular Recordings', 'location' => 'Sydney'})

label1.save
label2.save
label3.save
label4.save
label5.save


#RECORDS

record1 = Record.new({'title' => 'Music Has the Right to Children', 'artist' => 'Boards of Canada', 'genre' => 'Electronica', 'description' => 'Released 20 April 1998', 'stock_quantity' => '5', 'buying_cost' => '20', 'selling_price' => '30', 'label_id' => label1.id, 'file' => 'boc-mhtrtc.jpg'})

record2 = Record.new({'title' => 'Lost Horizons', 'artist' => 'Lemon Jelly', 'genre' => 'Downtempo', 'description' => 'Released 7 October 2002', 'stock_quantity' => '1', 'buying_cost' => '50', 'selling_price' => '85', 'label_id' => label2.id, 'file' => 'lj-lh.jpg'})

record3 = Record.new({'title' => 'Mezzanine', 'artist' => 'Massive Attack', 'genre' => 'Trip Hop', 'description' => 'Released 20 April 1998', 'stock_quantity' => '3', 'buying_cost' => '15', 'selling_price' => '21', 'label_id' => label3.id, 'file' => 'ma-m.jpg'})

record4 = Record.new({'title' => 'Black Sands', 'artist' => 'Bonobo', 'genre' => 'Electronic', 'description' => 'Released 29 March 2010', 'stock_quantity' => '2', 'buying_cost' => '20', 'selling_price' => '13', 'label_id' => label4.id, 'file' => 'b-bs.jpg'})

record5 = Record.new({'title' => 'Since I Left You', 'artist' => 'The Avalanches', 'genre' => 'Plunderphonics', 'description' => 'Released 27 November 2000', 'stock_quantity' => '2', 'buying_cost' => '25', 'selling_price' => '35', 'label_id' => label5.id, 'file' => 'ta-sily.jpg'})

record1.save
record2.save
record3.save
record4.save
record5.save


#SALES

# sale1 = Sale.new({'record_id' => record1.id, 'sale_quantity' => '3'})
# sale2 = Sale.new({'record_id' => record2.id, 'sale_quantity' => '1'})
# sale3 = Sale.new({'record_id' => record3.id, 'sale_quantity' => '2'})
# sale4 = Sale.new({'record_id' => record4.id, 'sale_quantity' => '1'})
# sale5 = Sale.new({'record_id' => record5.id, 'sale_quantity' => '2'})
#
# sale1.save
# sale2.save
# sale3.save
# sale4.save
# sale5.save
