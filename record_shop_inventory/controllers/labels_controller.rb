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
  @records = Label.get_records(params['id'])
  erb (:"/labels/show")
end

get '/labels/:id/edit' do
  @label = Label.label(params['id'].to_i)
  erb (:"/labels/edit")
end

post '/labels/:id' do
  label = Label.new(params)
  label.update
  redirect to ("/labels/"+params['id'].to_s)
end

post '/labels/:id/delete' do
  label = Label.label(params['id'].to_i)
  label.first.delete
  redirect to "/"
end
