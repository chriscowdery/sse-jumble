FactoryGirl.define do
  factory :submission do
    word
    people { |people| [people.association(:person)] } # for habtm people => submissions relationship
  end
end
