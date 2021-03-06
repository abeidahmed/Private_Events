Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create show], dependant: :destroy
  resources :events, only: %i[index new create show]
  post 'attendance', to: 'events#create_attendance'
  # delete 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
