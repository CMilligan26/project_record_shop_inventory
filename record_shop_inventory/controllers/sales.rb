require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/sale.rb' )
also_reload( '../models/*' )

get '/sales/all' do
  @sales = Sale.all
  erb ( :"/sales/all" )
end
