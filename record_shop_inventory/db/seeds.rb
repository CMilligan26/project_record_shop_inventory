require_relative('../models/artist')
require_relative('../models/genre_categorization')
require_relative('../models/genre')
require_relative('../models/label')
require_relative('../models/record')
require_relative('../models/sale')

Artist.delete_all
GenreCategorization.delete_all
Genre.delete_all
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

#ARTISTS

artist1 = Artist.new({'artist_name' => 'Boards of Canada'})

artist2 = Artist.new({'artist_name' => 'Lemon Jelly'})

artist3 = Artist.new({'artist_name' => 'Massive Attack'})

artist4 = Artist.new({'artist_name' => 'Bonobo'})

artist5 = Artist.new({'artist_name' => 'The Avalanches'})

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save

#GENRES

genre1 = Genre.new({'genre_name' => 'Electronica'})

genre2 = Genre.new({'genre_name' => 'Downtempo'})

genre3 = Genre.new({'genre_name' => 'Trip Hop'})

genre4 = Genre.new({'genre_name' => 'Electronic'})

genre5 = Genre.new({'genre_name' => 'Plunderphonics'})

genre1.save
genre2.save
genre3.save
genre4.save
genre5.save

#RECORDS

record1 = Record.new({'title' => 'Music Has the Right to Children', 'artist_id' => artist1.id, 'release_date' => '1998-04-20', 'stock_quantity' => '5', 'buying_cost' => '20', 'selling_price' => '30', 'label_id' => label1.id, 'file' => 'boc-mhtrtc.jpg'})

record2 = Record.new({'title' => 'Lost Horizons', 'artist_id' => artist2.id, 'release_date' => '2002-10-07', 'stock_quantity' => '1', 'buying_cost' => '50', 'selling_price' => '85', 'label_id' => label2.id, 'file' => 'lj-lh.jpg'})

record3 = Record.new({'title' => 'Mezzanine', 'artist_id' => artist3.id, 'release_date' => '1998-04-20', 'stock_quantity' => '3', 'buying_cost' => '15', 'selling_price' => '21', 'label_id' => label3.id, 'file' => 'ma-m.jpg'})

record4 = Record.new({'title' => 'Black Sands', 'artist_id' => artist4.id, 'release_date' => '2010-03-29', 'stock_quantity' => '2', 'buying_cost' => '20', 'selling_price' => '25', 'label_id' => label4.id, 'file' => 'b-bs.jpg'})

record5 = Record.new({'title' => 'Since I Left You', 'artist_id' => artist5.id, 'release_date' => '2000-11-27', 'stock_quantity' => '2', 'buying_cost' => '25', 'selling_price' => '35', 'label_id' => label5.id, 'file' => 'ta-sily.jpg'})

record1.save
record2.save
record3.save
record4.save
record5.save

#GENRE CATEGORIZATIONs

genre_categorization1 = GenreCategorization.new({'record_id' => record1.id, 'genre_id' => genre1.id})
genre_categorization6 = GenreCategorization.new({'record_id' => record1.id, 'genre_id' => genre2.id})
genre_categorization7 = GenreCategorization.new({'record_id' => record1.id, 'genre_id' => genre3.id})
genre_categorization8 = GenreCategorization.new({'record_id' => record1.id, 'genre_id' => genre4.id})
genre_categorization2 = GenreCategorization.new({'record_id' => record2.id, 'genre_id' => genre2.id})
genre_categorization3 = GenreCategorization.new({'record_id' => record3.id, 'genre_id' => genre3.id})
genre_categorization4 = GenreCategorization.new({'record_id' => record4.id, 'genre_id' => genre4.id})
genre_categorization5 = GenreCategorization.new({'record_id' => record5.id, 'genre_id' => genre5.id})

genre_categorization1.save
genre_categorization2.save
genre_categorization3.save
genre_categorization4.save
genre_categorization5.save
genre_categorization6.save
genre_categorization7.save
genre_categorization8.save



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
