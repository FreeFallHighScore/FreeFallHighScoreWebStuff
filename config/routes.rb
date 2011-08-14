FreeFallHighScoreWebStuff::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  get "/test"     => "home#test"
  get "/lifevests"  => "home#lifevests"
  get "/about"      => "home#about"
  get "/disclaimer" => "home#disclaimer"

  resources :videos

  root :to => "home#index"
end
