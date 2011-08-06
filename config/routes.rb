FreeFallHighScoreWebStuff::Application.routes.draw do
  get "home/index"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => "home#index"
end
