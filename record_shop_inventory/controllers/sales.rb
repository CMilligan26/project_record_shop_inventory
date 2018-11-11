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
  if sale.save == false
    redirect to ("/sales/failed")
  else
    redirect to ("/sales/all")
  end
end

get '/sales/:id/edit' do
  @records = Record.all
  @sale = Sale.sale(params['id'].to_i)
  erb (:"/sales/edit")
end

post '/sales/:id' do
  sale = Sale.new(params)
  sale.update
  redirect to ('/sales/all')
end

post '/sales/:id/delete' do
  sale = Sale.sale(params['id'].to_i)
  sale.first.delete
  redirect to "/sales/all"
end

get '/sales/failed' do
  erb (:"/sales/failed")
end
