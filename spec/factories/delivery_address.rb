FactoryBot.define do

  factory :delivery_address do
    postal_code                              {"112-1134"}
    prefectures_code                         {"愛知県"}                    
    city                                     {"名古屋市"}
    address                                  {"中区栄"}
    building_name                            {"栄ビル"}
    phone_number                             {"030-2345-2345"}
  end

end