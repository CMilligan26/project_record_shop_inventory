require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/genre.rb' )
also_reload( '../models/*' )

get '/genres/index' do
  @genres = Genre.all
  erb ( :"/genres/index" )
end

get '/genres/new' do
  erb ( :"/genres/new" )
end

post '/genres/new' do
  genre = Genre.new(params)
  genre.save
  redirect to ("/genres/"+genre.id.to_s)
end

get '/genres/:id' do
  @genre = Genre.genre(params['id'].to_i)
  @records = Genre.get_records(params['id'])
  erb (:"/genres/show")
end

post '/genres/:id' do
  genre = Genre.new(params)
  genre.update
  redirect to ("/genres/"+params['id'].to_s)
end

get '/genres/:id/edit' do
  @genre = Genre.genre(params['id'].to_i)
  erb (:"/genres/edit")
end

post '/genres/:id/delete' do
  genre = Genre.genre(params['id'].to_i)
  genre.first.delete
  redirect to "/"
end
