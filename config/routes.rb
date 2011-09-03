FreeFallHighScoreWebStuff::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  get "/lifevests"  => "home#lifevests"
  get "/about"      => "home#about"
  get "/disclaimer" => "home#disclaimer"
  get "/moderate"   => "home#moderate"

  resources :videos, :only => [:index] do
    member do
      put :enable
      put :disable
    end
  end

  resources :users, :only => [] do
    get :videos
  end

  root :to => "home#index"
end
