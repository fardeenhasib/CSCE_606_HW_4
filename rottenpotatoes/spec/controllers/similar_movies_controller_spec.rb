require 'rails_helper'

RSpec.describe SimilarMoviesController, type: :controller do
  context "search similar movies by director" do 
    
    describe 'movie with a director' do
      it "works without error" do
        movie = Movie.create(:id => "1", title: "Titanic", director: "Director1")
        
        get :index, {:id => movie[:id]}
      end
    end
    
    describe 'movie without a director' do
      it "redirects to home page" do
        movie = Movie.create(:id => "1", title: "Titanic")
        
        get :index, {:id => movie[:id]}
        
        expect(response).to redirect_to(movies_path)
      end
    end
  end
end
