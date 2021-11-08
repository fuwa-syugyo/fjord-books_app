Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'users', to: 'users/registrations#index'
    get 'users/:id', to: 'users/registrations#show'
    get 'users/:id/edit', to: 'users/registrations#edit'
  end 

  resources :books
  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
