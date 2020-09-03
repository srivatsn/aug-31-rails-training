require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    #movie = Movie.create(title: "Parasite", director: "Bong Joon-ho")
    movie = create(:movie)
    # As a user,
    # when I visit /movies/1
    visit("/movies/#{movie.id}") # visit("/movies/1")

    # I see the title of the movie "Parasite"
    assert_text "#{movie.title}"
    # I also see the name of the director "Bong Joon-ho"
    assert_text "#{movie.director}"
  end
  test "visiting titanic" do
    create(:movie)
    movie = create(:movie)

    # As a user,
    # when I visit /movies/1
    visit("/movies/2") # visit("/movies/1")
    # I see the title of the movie "Parasite"
    assert_text "#{movie.title}"
    # I also see the name of the director "Bong Joon-ho"
    assert_text "#{movie.director}"
  end

  test "visit movies index" do
    movie1 = create(:movie)
    movie2 = create(:movie)

    visit("/movies")
    assert_text "#{movie1.title}"
    assert_text "#{movie2.title}"
  end

  test "Create new movie" do
    create(:movie)
    create(:movie)

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
