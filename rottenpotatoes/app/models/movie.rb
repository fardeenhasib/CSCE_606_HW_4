class Movie < ActiveRecord::Base
    def find_similar
        Movie.where(director: self.director)
    end
end
