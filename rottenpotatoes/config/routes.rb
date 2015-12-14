Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get  ':controller/:action/:id'
#
# end

  # resources :movies do
  #   get 'same_director', :to => 'movies#same_director'
  # end
  # root :to => redirect('/movies')

end
