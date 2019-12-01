
require_relative( "../models/owner.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/adoption.rb" )

require("pry")

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()


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

  animal2 = Animal.new({
    "name" => "Thor",
    "adopt_status" => "training/vet care",
    "type" => "Cat",
    "breed" => "Persion Mix",
    "admis_date" => "9/10/2019",
    "good_with_kids" => "No",
    "good_with_other_pets" => "Yes",
    "need_attention" => "No"
    })

  animal2.save()

  animal3 = Animal.new({
    "name" => "Neo",
    "adopt_status" => "Adoptable",
    "type" => "Cat",
    "breed" => "Domestic Short-Hair",
    "admis_date" => "17/11/2019",
    "good_with_kids" => "Yes",
    "good_with_other_pets" => "Yes",
    "need_attention" => "No"
    })

  animal3.save()

  animal4 = Animal.new({
    "name" => "Alfie",
    "adopt_status" => "Adoptable",
    "type" => "Budgie",
    "breed" => "Green Squaker",
    "admis_date" => "13/10/2019",
    "good_with_kids" => "No",
    "good_with_other_pets" => "No",
    "need_attention" => "Yes"
    })

  animal4.save()



  owner1 = Owner.new({
    "name" => "Jeff Lebowski",
    "address" => "23 Mable Road, MW1 5XL",
    "suitablity" => "Suitable",
    "has_kids" => "Yes",
    "has_other_pets" => "No",
    "give_attention" => "Yes"

    })

    owner1.save()

  owner2 = Owner.new({
    "name" => "Postman Pat",
    "address" => "2 Cleo Lane, FK1 5PS",
    "suitablity" => "Suitable",
    "has_kids" => "No",
    "has_other_pets" => "Yes",
    "give_attention" => "No"

    })

    owner2.save()

  owner3 = Owner.new({
    "name" => "Helen Fafferty",
    "address" => "33 Jaffa Road, G1 2TL",
    "suitablity" => "Not Suitable",
    "has_kids" => "Yes",
    "has_other_pets" => "No",
    "give_attention" => "No"

    })

    owner3.save()

    adoption1 = Adoption.new({
    "animal_id" => animal1.id,
    "owner_id" => owner1.id,
    "adoption_date" => "30/11/2019"
    })

  adoption1.save()

  adoption2 = Adoption.new({
    "animal_id" => animal2.id,
    "owner_id" => owner2.id,
    "adoption_date" => "1/12/2019"
    })

  adoption2.save()

  adoption3 = Adoption.new({
    "animal_id" => animal3.id,
    "owner_id" => owner1.id,
    "adoption_date" => "26/11/2019"
    })

  adoption3.save()

  adoption4 = Adoption.new({
    "animal_id" => animal4.id,
    "owner_id" => owner2.id,
    "adoption_date" => "29/11/2019"
    })

  adoption4.save()

  binding.pry

  nil
