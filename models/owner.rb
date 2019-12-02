require_relative( '../db/sql_runner' )



class Owner

  attr_reader(:id)
  attr_accessor( :name, :address, :suitablity, :has_kids, :has_other_pets, :give_attention)

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
    values = [@name, @address, @suitablity, @has_kids, @has_other_pets, @give_attention, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Owner.new(results.first)
  end

  def animals()
    sql = "SELECT animals.*
    FROM animals
    INNER JOIN adoptions
    ON adoptions.animal_id = animals.id
    WHERE owner_id = $1"
    values = [@id]
    owners = SqlRunner.run(sql, values)
    result = owners.map {|owner| Owner.new(owner)}
    return result;
  end











  #
end
