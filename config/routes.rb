Rails.application.routes.draw do
  get '/star_wars' => 'star_wars#index'
  get '/star_wars/new' => 'star_wars#new'
  get '/star_wars/:id' => 'star_wars#show'
  post '/star_wars' => 'star_wars#create'
  get '/star_wars/:id/edit' => 'star_wars#edit'
  patch '/star_wars/:id' => 'star_wars#update'
  delete '/starwars/:id' => 'star_wars#destroy'
end
