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


get '/adoptions/new' do
  @animal = Animal.all
  @owner = Owner.all
  erb (:"adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save
  redirect("/adoptions")
end

get'/home' do
  erb(:home)
end
