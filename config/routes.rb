Rails.application.routes.draw do
  resources :ingredients, only: [:index]
  resources :cocktails, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :ingredients, only: [ :new, :create, :show, :edit, :update, :destroy]
    resources :doses,only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  root :to => "cocktails#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# A user can see the list of cocktails
# GET "cocktails"

# A user can see the details of a given cocktail, with the dose needed for each ingredient
# GET "cocktails/42"

# A user can create a new cocktail
# GET "cocktails/new"
# POST "cocktails"
