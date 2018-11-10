require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/label.rb' )
also_reload( '../models/*' )

get '/labels/all' do
  @labels = Label.all
  erb ( :"/labels/all" )
end

get '/labels/new' do
  erb ( :"/labels/new" )
end

post '/labels/new' do
  label = Label.new(params)
  label.save
  redirect to ("/labels/"+label.id.to_s)
end

get '/labels/:id' do
  @label = Label.label(params['id'].to_i)
  erb (:"/labels/show")
end
