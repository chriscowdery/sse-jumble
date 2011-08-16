FactoryGirl.define do
  factory :submission do
    sequence(:magic_string) do |n|
      person_list = FactoryGirl.create_list(:person, 4)
      FactoryGirl.create(:word, :word => (person_list.inject("") { |memo,obj| memo + obj.letter }))
      person_list.inject("") { |memo,obj| memo + ("%02d" % obj.id) }
    end
  end
end
