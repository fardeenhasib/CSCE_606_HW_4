Rottenpotatoes::Application.routes.draw do
  get 'similar_movies/:id', to: 'similar_movies#index', as: 'similar_movies'

  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
