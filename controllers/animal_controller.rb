require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')
also_reload('../models/*')



#Index set up
get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end

#show
get '/animals/:id' do
  id = params[:id].to_i()
  @animal = Animal.find(id)
  erb(:"animals/show")
end
