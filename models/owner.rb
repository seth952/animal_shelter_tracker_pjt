require_relative( '../db/sql_runner' )



class Owner

  attr_reader( :name, :address, :suitablity, :has_kids, :has_other_pets, :give_attention, :id)

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @address = details['address']
    @suitablity = details['suitablity']
    @has_kids = details['has_kids']
    @has_other_pets = details['has_other_pets']
    @give_attention = details['give_attention']
  end











  #
end
