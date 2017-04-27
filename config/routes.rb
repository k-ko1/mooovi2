TechReviewSite::Application.routes.draw do
  root 'products#index'
  resources 'products'
end
