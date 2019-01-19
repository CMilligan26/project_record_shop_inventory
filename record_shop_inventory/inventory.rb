require( 'sinatra' )
require('sinatra/contrib/all') if development?
require_relative( 'controllers/records_controller' )
require_relative( 'controllers/sales_controller' )
require_relative( 'controllers/labels_controller' )
require_relative( 'controllers/artists_controller' )
require_relative( 'controllers/genres_controller' )
require_relative( 'models/record.rb' )

get '/' do
  @records = Record.all(params['sort'])
  erb ( :"main_index" )
end
