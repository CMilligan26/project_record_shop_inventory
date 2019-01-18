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

label6 = Label.new({'name' => 'PLUS100 Records', 'location' => 'Atlanta'})

label7 = Label.new({'name' => 'Harvest Records', 'location' => 'Hollywood'})

label8 = Label.new({'name' => 'Merge', 'location' => 'Durham'})

label9 = Label.new({'name' => 'Apollo Records', 'location' => 'Ghent'})

label10 = Label.new({'name' => 'Creation Records', 'location' => 'London'})

label11 = Label.new({'name' => 'Domino Recording Company', 'location' => 'London'})


label1.save
label2.save
label3.save
label4.save
label5.save
label6.save
label7.save
label8.save
label9.save
label10.save
label11.save

#ARTISTS

artist1 = Artist.new({'artist_name' => 'Boards of Canada'})

artist2 = Artist.new({'artist_name' => 'Lemon Jelly'})

artist3 = Artist.new({'artist_name' => 'Massive Attack'})

artist4 = Artist.new({'artist_name' => 'Bonobo'})

artist5 = Artist.new({'artist_name' => 'The Avalanches'})

artist6 = Artist.new({'artist_name' => 'Vaperror'})

artist7 = Artist.new({'artist_name' => 'Death Grips'})

artist8 = Artist.new({'artist_name' => 'Neutral Milk Hotel'})

artist9 = Artist.new({'artist_name' => 'Aphex Twin'})

artist10 = Artist.new({'artist_name' => 'My Bloody Valentine'})

artist11 = Artist.new({'artist_name' => 'Animal Collective'})

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save
artist6.save
artist7.save
artist8.save
artist9.save
artist10.save
artist11.save

#GENRES

genre1 = Genre.new({'genre_name' => 'Electronica'})

genre2 = Genre.new({'genre_name' => 'Downtempo'})

genre3 = Genre.new({'genre_name' => 'Trip Hop'})

genre4 = Genre.new({'genre_name' => 'Electronic'})

genre5 = Genre.new({'genre_name' => 'Plunderphonics'})

genre6 = Genre.new({'genre_name' => 'Vaportrap'})

genre7 = Genre.new({'genre_name' => 'Industrial Hip Hop'})

genre8 = Genre.new({'genre_name' => 'Indie Rock'})

genre9 = Genre.new({'genre_name' => 'Ambient Techno'})

genre10 = Genre.new({'genre_name' => 'Shoegaze'})

genre11 = Genre.new({'genre_name' => 'Psychedelic Pop'})


genre1.save
genre2.save
genre3.save
genre4.save
genre5.save
genre6.save
genre7.save
genre8.save
genre9.save
genre10.save
genre11.save

#RECORDS

record1 = Record.new({'title' => 'Music Has the Right to Children', 'artist_id' => artist1.id, 'release_date' => '1998-04-20', 'stock_quantity' => '10', 'buying_cost' => '20', 'selling_price' => '30', 'label_id' => label1.id, 'file' => 'https://img.discogs.com/LzJ7u2lqvDRBGtqiiGWFe2BkHN8=/fit-in/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-11778-1475170215-9229.jpeg.jpg'})

record2 = Record.new({'title' => 'Lost Horizons', 'artist_id' => artist2.id, 'release_date' => '2002-10-07', 'stock_quantity' => '1', 'buying_cost' => '50', 'selling_price' => '85', 'label_id' => label2.id, 'file' => 'https://cps-static.rovicorp.com/3/JPG_500/MI0000/372/MI0000372724.jpg?partner=allrovi.com'})

record3 = Record.new({'title' => 'Mezzanine', 'artist_id' => artist3.id, 'release_date' => '1998-04-20', 'stock_quantity' => '3', 'buying_cost' => '15', 'selling_price' => '21', 'label_id' => label3.id, 'file' => 'https://images-na.ssl-images-amazon.com/images/I/71mFt4ktPZL._SX355_.jpg'})

record4 = Record.new({'title' => 'Black Sands', 'artist_id' => artist4.id, 'release_date' => '2010-03-29', 'stock_quantity' => '2', 'buying_cost' => '18', 'selling_price' => '25', 'label_id' => label4.id, 'file' => 'https://images-na.ssl-images-amazon.com/images/I/81JesaNAP7L._SY355_.jpg'})

record5 = Record.new({'title' => 'Since I Left You', 'artist_id' => artist5.id, 'release_date' => '2000-11-27', 'stock_quantity' => '2', 'buying_cost' => '25', 'selling_price' => '35', 'label_id' => label5.id, 'file' => 'https://static.spin.com/files/2016/07/avalanches-since-i-left-you1-640x640.jpg'})

record6 = Record.new({'title' => 'Mana Pool', 'artist_id' => artist6.id, 'release_date' => '2014-06-02', 'stock_quantity' => '5', 'buying_cost' => '17', 'selling_price' => '30', 'label_id' => label6.id, 'file' => 'https://f4.bcbits.com/img/a3009056645_16.jpg'})

record7 = Record.new({'title' => 'Year of the Snitch', 'artist_id' => artist7.id, 'release_date' => '2018-06-22', 'stock_quantity' => '3', 'buying_cost' => '20', 'selling_price' => '30', 'label_id' => label7.id, 'file' => 'https://i.kym-cdn.com/photos/images/original/001/359/425/d92.jpg'})

record8 = Record.new({'title' => 'In the Aeroplane Over the Sea', 'artist_id' => artist8.id, 'release_date' => '1998-02-10', 'stock_quantity' => '8', 'buying_cost' => '14', 'selling_price' => '21', 'label_id' => label8.id, 'file' => 'https://i.scdn.co/image/4bd59c0b2ef97a9225600b4d5d5e7b45395ed9ad'})

record9 = Record.new({'title' => 'Selected Ambient Works 85–92', 'artist_id' => artist9.id, 'release_date' => '1992-02-12', 'stock_quantity' => '5', 'buying_cost' => '20', 'selling_price' => '30', 'label_id' => label9.id, 'file' => 'https://img.discogs.com/2ovqXhO78mJBYEdvKW-2tVjJRYE=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-32662-1221896955.jpeg.jpg'})

record10 = Record.new({'title' => 'Loveless', 'artist_id' => artist10.id, 'release_date' => '1991-11-04', 'stock_quantity' => '2', 'buying_cost' => '80', 'selling_price' => '120', 'label_id' => label10.id, 'file' => 'https://ksassets.timeincuk.net/wp/uploads/sites/55/2012/08/18.Mybloodyvalentine_lovelss_161013-1.jpg'})

record11 = Record.new({'title' => 'Painting With', 'artist_id' => artist11.id, 'release_date' => '2016-02-19', 'stock_quantity' => '16', 'buying_cost' => '12', 'selling_price' => '18', 'label_id' => label11.id, 'file' => 'https://thelpcafe.com/wp-content/uploads/2017/11/painting-with-animal-collective-1.png'})

record1.save
record2.save
record3.save
record4.save
record5.save
record6.save
record7.save
record8.save
record9.save
record10.save
record11.save

#GENRE CATEGORIZATIONs

genre_categorization1 = GenreCategorization.new({'record_id' => record1.id, 'genre_id' => genre1.id})
genre_categorization2 = GenreCategorization.new({'record_id' => record2.id, 'genre_id' => genre2.id})
genre_categorization3 = GenreCategorization.new({'record_id' => record3.id, 'genre_id' => genre3.id})
genre_categorization4 = GenreCategorization.new({'record_id' => record4.id, 'genre_id' => genre4.id})
genre_categorization5 = GenreCategorization.new({'record_id' => record5.id, 'genre_id' => genre5.id})
genre_categorization6 = GenreCategorization.new({'record_id' => record6.id, 'genre_id' => genre6.id})
genre_categorization7 = GenreCategorization.new({'record_id' => record7.id, 'genre_id' => genre7.id})
genre_categorization8 = GenreCategorization.new({'record_id' => record8.id, 'genre_id' => genre8.id})
genre_categorization9 = GenreCategorization.new({'record_id' => record9.id, 'genre_id' => genre9.id})
genre_categorization10 = GenreCategorization.new({'record_id' => record10.id, 'genre_id' => genre10.id})
genre_categorization11 = GenreCategorization.new({'record_id' => record11.id, 'genre_id' => genre11.id})

genre_categorization1.save
genre_categorization2.save
genre_categorization3.save
genre_categorization4.save
genre_categorization5.save
genre_categorization6.save
genre_categorization7.save
genre_categorization8.save
genre_categorization9.save
genre_categorization10.save
genre_categorization11.save


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
