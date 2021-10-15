require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'search similar movies by director' do
    it 'returns movies with the same director' do
      movie1 = Movie.create(:id => "1", title: "Movie1", director: "AFB")
      movie2 = Movie.create(:id => "2", title: "Movie2", director: "AFB")
      
      expect(movie1.find_similar).to include(movie2)
    end        
  
    it 'doesn\'t return movies with different directors' do
      movie1 = Movie.create(:id => "1", title: "Movie1", director: "AFB")
      movie2 = Movie.create(:id => "2", title: "Movie2", director: "SB")
      
      expect(movie1.find_similar).not_to include(movie2)
    end
  end
end
