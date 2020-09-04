FactoryBot.define do
    factory :director do
      name { Faker::Name.name  }
      age  { Faker::Number.between(from: 1, to: 100) }
    end
end