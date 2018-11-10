require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/records' )
require_relative( 'controllers/sales' )
require_relative( 'controllers/labels' )
require_relative( 'models/record.rb' )
also_reload( 'models/*' )

get '/' do
  @records = Record.all
  erb ( :"index" )
end
