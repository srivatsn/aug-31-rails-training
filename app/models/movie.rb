class Movie < ApplicationRecord
    validates_presence_of :title
        
    belongs_to :director
    def self.fancy_enum(definitions) 
        definitions.each do |name, values|
            pairs = values.each_with_index
            define_method(name) {         
                # movie.read_attribute(:color_format)
                color_format_database_value = read_attribute(name) # 0 or 1  
        
                # [:color, :black_and_white] 
                values[color_format_database_value].to_s
            }

            pairs.each do |label, value|
                name = name.to_s

                define_method("#{label}?") { self[name] == value }
                define_method("is_in_#{label}?") { self[name] == value }
                define_method("#{label}!") { update!(name => value) }
            end

        end

    end


    fancy_enum color_format: [:color, :black_and_white]

    def self.more_fb_likes_than(x)
        where("facebook_likes > ?", x)
    end

    def self.by_title()
        pluck(:title)
    end

    def self.by_director_after_2010(director)
        where("director = ? AND year < 2010", director)
    end

    def self.most_to_least_fb_likes
        order(facebook_likes: :desc)
    end

    def self.year_by_title(title)
        Movie.find_by(title: title).year
    end

end