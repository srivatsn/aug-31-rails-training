directors = FactoryBot.create_list(:director, 100)

directors.each do |director|
  FactoryBot.create_list(:movie, rand(10), director: director)
end