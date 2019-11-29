require_relative( '../db/sql_runner' )



class Adoption

  attr_reader( :animal_id, :owner_id, :adoption_date, :id)

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @animal_id = details['animal_id'].to_i()
    @owner_id = details['owner_id'].to_i()
    @adoption_date = details['adoption_date']
  end


  def save()
    sql = "INSERT INTO adoptions(animal_id, owner_id, adoption_date)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@animal_id, @owner_id, @adoption_date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |adoption| Adoption.new(adoption)}
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE adoptions SET
    (animal_id, owner_id, adoption_date) = ($1, $2, $3)
    WHERE id = $4"
    values = [@animal_id, @owner_id, @adoption_date, @id]
    SqlRunner.run(sql, values)

  end





  #
end
