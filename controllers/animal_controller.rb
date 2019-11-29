require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
also_reload('../models/*')

#Index set up
get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end
