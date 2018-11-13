require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')
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
  old_sale = Sale.sale(params['id'].to_i)
  params['overhead'] = old_sale.first.overhead
  sale = Sale.new(params)
  if sale.update == false
    redirect to ("/sales/failed")
  else
    redirect to ("/sales/all")
  end
end

post '/sales/:id/delete' do
  sale = Sale.sale(params['id'].to_i)
  sale.first.delete
  redirect to "/sales/all"
end

get '/sales/failed' do
  erb (:"/sales/failed")
end

get '/sales/:record_id/new' do
  @record = Record.record(params['record_id'].to_i)
  erb ( :"/sales/record_new" )
end

post '/sales/:record_id/new' do
  sale = Sale.new(params)
  if sale.save == false
    redirect to ("/sales/failed")
  else
    redirect to ("/sales/all")
  end
end
