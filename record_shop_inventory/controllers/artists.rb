require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
also_reload( '../models/*' )

get '/artists/all' do
  @artists = Artist.all
  erb ( :"/artists/all" )
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
  erb (:"/artists/show")
end

get '/artists/:id/edit' do
  @artist = Artist.artist(params['id'].to_i)
  erb (:"/artists/edit")
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to ("/artists/"+params['id'].to_s)
end

post '/artists/:id/delete' do
  artist = Artist.artist(params['id'].to_i)
  artist.first.delete
  redirect to "/"
end
