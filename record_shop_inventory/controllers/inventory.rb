require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/record.rb' )
require_relative( '../models/label.rb' )
also_reload( '../models/*' )

get '/inventory' do
@records = Record.all
@labels
erb (:inventory)
end
