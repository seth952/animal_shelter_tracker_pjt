require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')
require_relative('../models/animal.rb')
require_relative('../models/adoption.rb')
also_reload('../models/*')

#Index set up
get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

#show
get '/owners/:id' do
  id = params[:id].to_i()
  @owner = Owner.find(id)
  erb(:"owners/show")
end
