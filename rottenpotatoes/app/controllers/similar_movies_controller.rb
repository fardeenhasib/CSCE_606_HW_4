class SimilarMoviesController < ApplicationController
  def index
    @movie = Movie.find(params[:id])
    
    if(@movie.director.blank?) then
      flash[:notice] = "'#{@movie.title}' has no director info"
      
      redirect_to movies_path
      
      return
    end
      
    @similar_movies = @movie.find_similar
  end
end
