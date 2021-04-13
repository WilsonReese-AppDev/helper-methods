Rails.application.routes.draw do
  # get "/", controller: "movies", action: "index"
  
  root "movies#index"
  
  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies # movies_url and movies_path
  get "/movies/new" => "movies#new", as: :new_movie #new_movie_url and new_movie_path
          
  # READ
  get "/movies" => "movies#index" #already named above
  get "/movies/:id" => "movies#show", as: :movie # movie_url() and movie_path(), expects argument to populate id segment
  
  # UPDATE
  patch "/movies/:id" => "movies#update" # already named
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie # edit_movie_url() and edit_movie_path()
  
  # DELETE
  delete "/movies/:id" => "movies#destroy" # will be movie_path

  #------------------------------
end
