require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    # As a user,
    # when I visit /movies/1
    visit "/movies/1" # visit("/movies/1")
    # I see the title of the movie "Parasite"
    # I also see the name of the director "Bong Joon-ho"
  end
end
