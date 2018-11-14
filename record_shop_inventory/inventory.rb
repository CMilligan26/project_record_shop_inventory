require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/records_controller' )
require_relative( 'controllers/sales_controller' )
require_relative( 'controllers/labels_controller' )
require_relative( 'controllers/artists_controller' )
require_relative( 'controllers/genres_controller' )
require_relative( 'models/record.rb' )
also_reload( 'models/*' )
require('pry-byebug')

get '/' do
  @records = Record.all(params['sort'])
  erb ( :"index" )
end
