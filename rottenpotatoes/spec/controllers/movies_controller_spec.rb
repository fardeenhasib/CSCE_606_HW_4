require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
   describe "create" do
    it 'creates the movie and redirects to home page' do
      title = 'Movie'
      
      post :create, {:movie => {:title => title}}
      
      len = Movie.where(title: title).length
      expect(len).to be(1)
      
      expect(response).to redirect_to(movies_path)
    end
  end
  
  describe "destroy" do
    it 'destroys the movie and redirects to home page' do
      movie = Movie.create(:id => "1", title: "Movie")
      
      len = Movie.where(title: movie.title).length
      expect(len).to be(1)
    
      post :destroy, {:id => movie.id}
      
      len = Movie.where(title: movie.title).length
      expect(len).to be(0)
      
      expect(response).to redirect_to(movies_path)
    end
  end
  
  describe "update" do
    it 'updates the movie and redirects to movie details page' do
      movie = Movie.create(:id => "1", title: "Movie")
      
      new_title = 'New Movie'
      
      len = Movie.where(title: movie.title).length
      expect(len).to be(1)
    
      post :update, {:id => movie.id, :movie => {:title => new_title}}
      
      len = Movie.where(title: new_title).length
      expect(len).to be(1)
      
      expect(response).to redirect_to(movie_path(movie))
    end
  end
end
