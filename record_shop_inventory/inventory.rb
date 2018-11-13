require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/records' )
require_relative( 'controllers/sales' )
require_relative( 'controllers/labels' )
require_relative( 'controllers/artists' )
require_relative( 'controllers/genres' )
require_relative( 'models/record.rb' )
also_reload( 'models/*' )
require('pry-byebug')

get '/' do
  @records = Record.all
  erb ( :"index" )
end

post '/' do
  @records = Record.all(params['sort'])
  erb ( :"index" )
end
