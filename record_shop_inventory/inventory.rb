require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'models/record.rb' )
also_reload( 'models/*' )

get '/' do
  @records = Record.all
  erb ( :"records/index" )
end
