Rails.application.routes.draw do
  root 'weather#index'
  get 'weather/index'
  get 'weather/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
