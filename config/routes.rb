Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :answers, only: [:index, :show, :create, :update, :destoy]
  resources :exams, only: [:index, :show, :create, :update, :destoy]
  resources :questions, only: [:index, :show, :create, :update, :destoy]
  resources :subjects, only: [:index, :show, :create, :update, :destoy]
  resources :text_fields, only: [:index, :show, :create, :update, :destoy]
  resources :variables, only: [:index, :show, :create, :update, :destoy]
end
