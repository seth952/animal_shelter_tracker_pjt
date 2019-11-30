require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')
also_reload('../models/*')


get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"adoptions/index")
end
