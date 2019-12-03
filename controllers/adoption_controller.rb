require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/adoption.rb')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')

also_reload('../models/*')


get '/adoptions' do
  @adoptions = Adoption.all()
  @owners = Owner.all()
  @animals = Animal.all()
  erb (:"adoptions/index")
end

get'/home' do
  erb(:home)
end
