require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/record.rb' )
also_reload( '../models/*' )

get '/records/new' do
  @records = Record.all
  @labels = Label.all
  erb ( :"/records/new" )
end
