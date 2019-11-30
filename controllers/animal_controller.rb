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
#new route
get '/animals/new' do
  erb(:"animals/new")

end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect "/animals"
end






#show
get '/animals/:id' do
  id = params[:id].to_i()
  @animal = Animal.find(id)
  erb(:"animals/show")
end
