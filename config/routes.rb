Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :users
  resources :questions do
    resources :answers

  end
  resources :answers do
    resources :votes, :only => [:create]
  end

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

end
