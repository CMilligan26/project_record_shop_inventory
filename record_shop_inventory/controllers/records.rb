require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/record.rb' )
also_reload( '../models/*' )

get '/records/new' do
  @records = Record.all
  @labels = Label.all
  erb ( :"/records/new" )
end

post '/records/new' do
  record = Record.new(params)
  record.save
  redirect to ("/records/"+record.id.to_s)
end

get '/records/:id' do
  @record = Record.record(params['id'].to_i)
  @label = Label.label(@record.first.label_id)
  erb (:"/records/show")
end
