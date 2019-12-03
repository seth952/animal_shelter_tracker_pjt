require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')

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


post '/animals/:id/delete' do
  id = params[:id].to_i()
  animal = Animal.find(id)
  animal.delete()
  redirect '/animals'
end

get '/animals/:id/edit' do
  id = params[:id].to_i()
  @animal = Animal.find(id)
  erb(:"animals/edit")
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update()
  redirect '/animals'
end

get '/home/' do
  @adoptions = Adoption.all()
  @owners = Owner.all()
  @animals = Animal.all()
  erb (:home)

end
