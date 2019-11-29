require_relative( '../db/sql_runner' )


class Animal

  attr_reader( :name, :adopt_status, :type, :breed, :admis_date, :good_with_kids, :good_with_other_pets, :need_attention)

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










  #
end
