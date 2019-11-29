require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner.rb')
also_reload('../models/*')

#Index
get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end
