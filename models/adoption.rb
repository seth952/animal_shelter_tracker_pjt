require_relative( '../db/sql_runner' )



class Adoption

  attr_reader( :animal_id, :owner_id, :adoption_date, :id)

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @animal_id = ['animal_id'].to_i()
    @owner_id = ['owner_id'].to_i()
    @adoption_date = ['adoption_date']
  end









  #
end
