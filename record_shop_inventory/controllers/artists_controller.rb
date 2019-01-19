require( 'sinatra' )
require('sinatra/contrib/all') if development?
require_relative( '../models/artist.rb' )

get '/artists/index' do
  @artists = Artist.all
  erb ( :"/artists/index" )
end

get '/artists/new' do
  erb ( :"/artists/new" )
end

post '/artists/new' do
  artist = Artist.new(params)
  artist.save
  redirect to ("/artists/"+artist.id.to_s)
end

get '/artists/:id' do
  @artist = Artist.artist(params['id'].to_i)
  @records = Artist.get_records(params['id'])
  erb (:"/artists/show")
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to ("/artists/"+params['id'].to_s)
end

get '/artists/:id/edit' do
  @artist = Artist.artist(params['id'].to_i)
  erb (:"/artists/edit")
end

post '/artists/:id/delete' do
  artist = Artist.artist(params['id'].to_i)
  artist.first.delete
  redirect to "/"
end
