require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    movie = create(:movie)

    visit movie_path(movie)

    assert_text movie.title
    assert_text movie.director
  end

  test "visiting the index" do
    movies = create_list(:movie, 2)

    visit movies_path

    assert_text movies.first.title
    assert_text movies.first.director

    assert_text movies.second.title
    assert_text movies.second.director
  end

  test "creating a new movie" do
    # As a user,
    #   When I visit "/movies",
    #   I see a link/button to add a new movie.
    visit movies_path

    assert_button "Add New Movie"

    click_button "Add New Movie"
    #   When I click on "Add New Movie",

    assert_current_path "/movies/new"
    #   I am on a new page,

    assert_selector ".new_movie"
    #   and I see a form to add a new movie.
    #
    fill_in :movie_title, with: "Drop Dead Fred"
    fill_in :movie_director, with: "Ilana Corson"
    fill_in :movie_year, with: "1992"

    click_on "Add Movie"
    #   I fill in the title, director name and year
    #   I click "Add Movie",
    assert_text "Drop Dead Fred"
    assert_text "Ilana Corson"
    assert_text "1992"
    #   and I am redirected to the page for that movie,
    #   and I see the title, director name and year.
  end

  test "edit a movie" do
    year = "2017"
    movie = create(:movie, year: year)

    visit "/movies/#{movie.id}"

    assert_button "Edit #{movie.title}"

    click_button "Edit #{movie.title}"

    assert_current_path "/movies/#{movie.id}/edit"

    assert_selector ".edit_movie"
    
    fill_in :movie_year, with: "2019"

    click_on "Update Movie"

    assert_text "2019"
    assert_no_text year
  end
end