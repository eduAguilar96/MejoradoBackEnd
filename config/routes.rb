Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :answers, only: [:index, :show, :create, :update, :destroy]
  resources :exams, only: [:index, :show, :create, :update, :destroy]
  resources :questions, only: [:index, :show, :create, :update, :destroy]
  resources :subjects, only: [:index, :show, :create, :update, :destroy]
  resources :text_fields, only: [:index, :show, :create, :update, :destroy]
  resources :variables, only: [:index, :show, :create, :update, :destroy]

  get '/exams/:id/gen/:times', to: 'exams#generate'
end
