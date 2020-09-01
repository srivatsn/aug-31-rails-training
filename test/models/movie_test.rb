require 'test_helper'

class MovieTest < ActiveSupport::TestCase
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
end
