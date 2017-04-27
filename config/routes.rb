TechReviewSite::Application.routes.draw do
  root 'products#index'
  resources :products do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end
