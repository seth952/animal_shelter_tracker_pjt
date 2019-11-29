require_relative( '../db/sql_runner' )


class Animal

  attr_reader(:id)
  attr_accessor( :name, :adopt_status, :type, :breed, :admis_date, :good_with_kids, :good_with_other_pets, :need_attention)

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @adopt_status = details['adopt_status']
    @type = details['type']
    @breed = details['breed']
    @admis_date = details['admis_date']
    @good_with_kids = details['good_with_kids']
    @good_with_other_pets = details['good_with_other_pets']
    @need_attention = details['need_attention']
  end

  def save()
    sql = "INSERT INTO animals(name, adopt_status, type, breed,
  admis_date, good_with_kids, good_with_other_pets, need_attention)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7, $8)
    RETURNING id"
    values = [@name, @adopt_status, @type, @breed, @admis_date, @good_with_kids, @good_with_other_pets, @need_attention]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |animal| Animal.new(animal)}
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end
  #
  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE animals SET
    (name, adopt_status, type, breed,
  admis_date, good_with_kids,
  good_with_other_pets, need_attention)
     = ($1, $2, $3, $4, $5, $6, $7, $8)
    WHERE id = $9"
    values = [@name, @adopt_status, @type, @breed, @admis_date, @good_with_kids, @good_with_other_pets, @need_attention, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results.first)
  end











  #
end
