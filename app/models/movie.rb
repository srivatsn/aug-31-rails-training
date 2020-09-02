class Movie < ApplicationRecord
    validates_presence_of :title

    def self.with_facebook_likes(x)
        where("facebook_likes > ?", x)
    end

    def self.titles()
        pluck(:title)
    end

    def self.by_director_after_2010(director)
        where("director = ? AND year < 2010", director)
    end

    def self.by_most_facebook_likes
        order(facebook_likes: :desc)
    end

    def self.year_by_title(title)
        Movie.find_by(title: title).year
    end

end