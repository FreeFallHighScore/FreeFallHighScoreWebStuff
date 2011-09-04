FreeFallHighScoreWebStuff::Application.routes.draw do
  match "/staging/auth/:provider/callback" => "sessions#create"
  match "/staging/signout" => "sessions#destroy", :as => :signout

  get "/staging/preservers"  => "home#preservers", :as => :preservers
  get "/staging/where"       => "home#where", :as => :where
  get "/staging/about"       => "home#about", :as => :about
  get "/staging/disclaimer"  => "home#disclaimer", :as => :disclaimer
  get "/staging/moderate"    => "home#moderate", :as => :moderate

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
