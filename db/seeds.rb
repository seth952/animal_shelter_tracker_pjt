require_relative( "../models/owner.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/adoption.rb" )
require("pry")


  animal1 = Animal.new({
    "name" => "Dougal",
    "adopt_status" => "Adoptable",
    "type" => "Dog",
    "breed" => "Bearded Collie",
    "admis_date" => "4/11/2019",
    "good_with_kids" => "Yes",
    "good_with_other_pets" => "Yes",
    "need_attention" => "No"
    })

  animal1.save()


  binding.pry

  nil
