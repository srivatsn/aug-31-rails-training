require 'test_helper'

class MovieTest < ActiveSupport::TestCase
    setup do
        Movie.new(title: "Titanic", director: "Cameron", facebook_likes: 10, year: "2000").save
        Movie.new(title: "Titanic2", director: "Cameron2", facebook_likes: 1, year: "2015").save
    end

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

    test "movid is valid with a title" do
        movie = Movie.new(title: "Titanic", director: "Cameron")
        
        assert_equal "Titanic", movie.title
        assert_equal "Cameron", movie.director
        assert movie.valid?
    end
    test "movie is invalid without a title" do
        movie = Movie.new(title: "", director: "Cameron")
        refute movie.valid?
    end

    test "with_facebook_likes" do
        count = Movie.with_facebook_likes(5).count
        assert_equal 1, count
    end

    test "titles" do
        titles = Movie.titles()
        assert_equal ["Titanic", "Titanic2"], titles
    end

    test "by_director_after_2010" do
        count = Movie.by_director_after_2010("Cameron").count
        assert_equal 1, count
    end

    test "year_by_title" do
        year = Movie.year_by_title("Titanic")
        assert_equal "2000", year
    end

    test "by_most_facebook_likes" do
        movie = Movie.by_most_facebook_likes().first
        assert_equal 10, movie.facebook_likes
    end   
end
