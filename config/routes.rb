Freemarket::Application.routes.draw do
  resources :things do
    post 'want'
  end

  resources :wants, :only => [:show] do
    resources :messages, :only => [:create]
    post 'give'
  end

  get "home/index"
  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}
  root 'home#index'
  resources :users, :only => [:show, :index]

end
