require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')
require_relative('../models/animal.rb')

also_reload('../models/*')

#Index set up
get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

#new route
get '/owners/new' do
  erb(:"owners/new")

end

#create
post '/owners' do
  owner = Owner.new(params)
  owner.save()
  redirect "/owners"
end
#show
get '/owners/:id' do
  id = params[:id].to_i()
  @owner = Owner.find(id)
  erb(:"owners/show")
end
#delete
post '/owners/:id/delete' do
  id = params[:id].to_i()
  owner = Owner.find(id)
  owner.delete()
  redirect '/owners'
end
#edit
get '/owners/:id/edit' do
  id = params[:id].to_i()
  @owner = Owner.find(id)
  erb(:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update()
  redirect '/owners'
end
