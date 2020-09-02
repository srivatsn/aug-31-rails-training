require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    movie = Movie.create(title: "Parasite", director: "Bong Joon-ho")
   
    # As a user,
    # when I visit /movies/1
    visit("/movies/#{movie.id}") # visit("/movies/1")
    # I see the title of the movie "Parasite"
    assert_text "Parasite"
    # I also see the name of the director "Bong Joon-ho"
    assert_text "Bong Joon-ho"
  end
  test "visiting titanic" do
    Movie.create(title: "Parasite", director: "Bong Joon-ho")
    movie = Movie.create(title: "Titanic", director: "Cameron")

    # As a user,
    # when I visit /movies/1
    visit("/movies/2") # visit("/movies/1")
    # I see the title of the movie "Parasite"
    assert_text "Titanic"
    # I also see the name of the director "Bong Joon-ho"
    assert_text "Cameron"
  end

  test "visit movies index" do
    Movie.create(title: "Parasite", director: "Bong Joon-ho")
    Movie.create(title: "Titanic", director: "Cameron")

    visit("/movies")
    assert_text "Parasite"
    assert_text "Titanic"
  end

  test "Create new movie" do
    Movie.create(title: "Parasite", director: "Bong Joon-ho")
    Movie.create(title: "Titanic", director: "Cameron")

    visit("/movies")

    assert_button "Add New Movie"
    click_button "Add New Movie"
    assert_current_path '/movies/new'
    assert_selector '.new_movie'

    fill_in :movie_title, with: "Nemo"
    fill_in :movie_director, with: "Pixar"
    fill_in :movie_year, with: "1992"

    click_on "Add Movie"

    assert_text "Nemo"

  end

  test "edit a movie" do
    movie = Movie.create(title: "Jumanji", director: "Ilana Corson", year: "2017")

    visit "/movies/#{movie.id}"

    assert_button "Edit #{movie.title}"

    click_button "Edit #{movie.title}"

    assert_current_path "/movies/#{movie.id}/edit"

    assert_selector ".edit_movie"

    fill_in :movie_year, with: "2019"

    click_on "Update Movie"

    assert_text "2019"
    assert_no_text "2017"
  end
end
