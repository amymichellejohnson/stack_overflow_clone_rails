Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :users do
    resources :answers
    resources :questions
  end
  resources :questions do
    resources :answers
  end


  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

end
