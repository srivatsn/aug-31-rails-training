require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie has a color format" do
    movie = create(:movie)

    assert movie.color?, "should be color"
    refute movie.black_and_white?, "should not be black and white"
    assert_equal "color", movie.color_format

    movie.black_and_white!

    assert movie.black_and_white?, "should be black and white"
    refute movie.color?, "should not be color"

    assert_equal "black_and_white", movie.color_format
  end

  test "is_in methods" do
    movie = create(:movie)

    assert movie.is_in_color?, "should be color"
    refute movie.is_in_black_and_white?, "should not be black and white"

    movie.black_and_white!

    assert movie.is_in_black_and_white?, "should be black and white"
    refute movie.is_in_color?, "should not be color"
  end

  test "movie is valid with a title" do
    movie = build(:movie, title: "Parasite")

    assert_equal "Parasite", movie.title
    assert movie.valid?
  end

  test "the movie belongs to a director" do
    director = create(:director)
    movie = create(:movie, director: director)

    assert_equal director, movie.director
  end

  test "movie is invalid without a title" do
    movie = build(:movie, title: "")
    refute movie.valid?
  end

  test "movies titles only are returned" do
    create(:movie, title: "Jumanji")
    create(:movie, title: "Jumanji_2")
    create(:movie, title: "Jumanji_3")

    assert_equal ["Jumanji", "Jumanji_2", "Jumanji_3"], Movie.by_title
  end

  test "movies descending facebook_likes" do
    movie_1 = create(:movie, facebook_likes: 6)
    movie_2 = create(:movie, facebook_likes: 2)
    movie_3 = create(:movie, facebook_likes: 60)

    assert_equal [movie_3, movie_1, movie_2], Movie.most_to_least_fb_likes
  end

  test "movie year by title" do
    movie_1 = create(:movie, title: "tumanji", year: "2005")

    assert_equal "2005", Movie.year_by_title("tumanji")
  end

  test "movies with more than x fb likes" do
    movie_1 = create(:movie, facebook_likes: 90)
    movie_2 = create(:movie, facebook_likes: 6)
    movie_3 = create(:movie, facebook_likes: 44)
    movie_4 = create(:movie, facebook_likes: 43)

    assert_equal [movie_1, movie_3], Movie.more_fb_likes_than(43)
  end

  test "movie has many actors" do
    movie = create(:movie)

    assert movie.actors.empty?
  end

end