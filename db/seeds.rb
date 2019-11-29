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

  owner1 = Owner.new({
    "name" => "Jeff Lebowski",
    "address" => "23 Mable Road, MW1 5XL",
    "suitablity" => "Suitable",
    "has_kids" => "Yes",
    "has_other_pets" => "No",
    "give_attention" => "Yes"

    })

    owner1.save()

  adoption1 = Adoption.new({
    "animal_id" => animal1.id,
    "owner_id" => owner1.id,
    "adoption_date" => "30/11/2019"
    })

  adoption1.save()

  binding.pry

  nil
