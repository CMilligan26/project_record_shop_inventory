require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/sale.rb' )
also_reload( '../models/*' )

get '/sales/all' do
  @sales = Sale.all
  erb ( :"/sales/all" )
end

get '/sales/new' do
  @records = Record.all
  erb ( :"/sales/new" )
end

post '/sales/new' do
  sale = Sale.new(params)
  sale.save
  redirect to ("/sales/all")
end
