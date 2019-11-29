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


  def save()
    sql = "INSERT INTO owners(name, address, suitablity, has_kids, has_other_pets, give_attention)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @address, @suitablity, @has_kids, @has_other_pets, @give_attention]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end










  #
end
