FreeFallHighScoreWebStuff::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  get "/cities"     => "home#cities"
  get "/lifevests"  => "home#lifevests"
  get "/about"      => "home#about"
  get "/disclaimer" => "home#disclaimer"

  root :to => "home#index"
end
