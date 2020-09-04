FactoryBot.define do
  factory :movie do
    director
    producer
    title { Faker::Movie.title }
    year  { Faker::Date.backward(days:10000).year }
    plot_keywords { Faker::Lorem.words }
  end
end
