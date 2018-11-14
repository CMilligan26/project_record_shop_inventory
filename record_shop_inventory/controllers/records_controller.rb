require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( '../models/record.rb' )
require_relative( '../models/genre_categorization.rb' )
also_reload( '../models/*' )

get '/records/new' do
  @records = Record.all
  @labels = Label.all
  @artists = Artist.all
  @all_genres = Genre.all
  erb ( :"/records/new" )
end

post '/records/new' do
  if params['label_id'] == 'add_new'
    new_label = Label.new(params)
    new_label.save
    params['label_id'] = new_label.id
  end

  if params['artist_id'] == 'add_new'
    new_artist = Artist.new(params)
    new_artist.save
    params['artist_id'] = new_artist.id
  end

  record = Record.new(params)
  record.save

  if params['genre_name'] != ''
    genre = Genre.new({'genre_name' => params['genre_name']})
    genre.save
    gc = GenreCategorization.new({'record_id' => record.id, 'genre_id' => genre.id})
    gc.save
  end

  all_genres = Genre.all
  hash_counter = 0
  all_genres.count.times do
    if params.has_key?("genres"+hash_counter.to_s)
      hash = GenreCategorization.new({'record_id' => record.id, 'genre_id' => params["genres"+hash_counter.to_s]})
      hash.save
    end
    hash_counter+=1
  end

  redirect to ("/records/"+record.id.to_s)
end

get '/records/:id' do
  @record = Record.record(params['id'].to_i)
  @label = Label.label(@record.first.label_id)
  erb (:"/records/show")
end

post '/records/:id' do
  if params['label_id'] == 'add_new'
    new_label = Label.new(params)
    new_label.save
    params['label_id'] = new_label.id
  end

  if params['artist_id'] == 'add_new'
    new_artist = Artist.new(params)
    new_artist.save
    params['artist_id'] = new_artist.id
  end

  GenreCategorization.delete_all_for_record(params['id'].to_i)
  all_genres = Genre.all
  hash_counter = 0
  all_genres.count.times do
    if params.has_key?("genres"+hash_counter.to_s)
      hash = GenreCategorization.new({'record_id' => params['id'], 'genre_id' => params["genres"+hash_counter.to_s]})
      hash.save
    end
    hash_counter+=1
  end

  if params['genre_name'] != ''
    genre = Genre.new({'genre_name' => params['genre_name']})
    genre.save
    gc = GenreCategorization.new({'record_id' => params['id'], 'genre_id' => genre.id})
    gc.save
  end

  old_record = Record.record(params['id'].to_i)
  params['stock_quantity'] = old_record.first.provide_stock_quantity
  record = Record.new(params)
  if record.file = ""
    record.file = old_record.first.file
  end
  record.update
  redirect to ("/records/"+params['id'].to_s)
end

get '/records/:id/edit' do
  @record = Record.record(params['id'].to_i)
  @labels = Label.all
  @label = Label.label(@record.first.label_id)
  @artists = Artist.all
  @artist = Artist.artist(@record.first.artist_id)
  @all_genres = Genre.all
  @genres = @record.first.get_all_genres
  erb (:"/records/edit")
end

post '/records/:id/delete' do
  record = Record.record(params['id'].to_i)
  record.first.delete
  redirect to "/"
end

get '/records/:id/add_stock' do
  @record = Record.record(params['id'].to_i)
  erb (:"/records/add_stock")
end

post '/records/:id/add_stock' do
  record = Record.record(params['id'].to_i)
  record.first.update_running_stock_total(params['add_stock'].to_i)
  redirect to ("/records/"+params['id'].to_s)
end
