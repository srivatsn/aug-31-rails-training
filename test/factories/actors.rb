FactoryBot.define do
  factory :actor do
    name { Faker::Name.name }
    age { rand(3..99) }
    oscar_nominee { false }
  end
end
