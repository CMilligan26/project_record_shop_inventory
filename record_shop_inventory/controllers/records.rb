require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( '../models/record.rb' )
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
    record = Record.new(params)
    record.save
    redirect to ("/records/"+record.id.to_s)
  else
  record = Record.new(params)
  record.save
  redirect to ("/records/"+record.id.to_s)
  end
end

get '/records/:id' do
  @record = Record.record(params['id'].to_i)
  @label = Label.label(@record.first.label_id)
  erb (:"/records/show")
end

get '/records/:id/edit' do
  @record = Record.record(params['id'].to_i)
  @labels = Label.all
  @label = Label.label(@record.first.label_id)
  @artists = Artist.all
  @artist = Artist.artist(record.first.artist_id)
  @all_genres = Genre.all
  @genres = @record.first.get_all_genres
  erb (:"/records/edit")
end

post '/records/:id' do
  old_record = Record.record(params['id'].to_i)
  record = Record.new(params)
  if record.file = ""
    record.file = old_record.first.file
  end
  record.update
  redirect to ("/records/"+params['id'].to_s)
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
