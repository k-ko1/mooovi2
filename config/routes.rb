TechReviewSite::Application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
