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

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |owner| Owner.new(owner)}
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end
  #
  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE owners SET
    (name, address, suitablity, has_kids, has_other_pets, give_attention)
     = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @address, @suitablity, @has_kids, @has_other_pets, @give_attention]
    SqlRunner.run(sql, values)
  end








  #
end
