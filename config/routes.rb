FreeFallHighScoreWebStuff::Application.routes.draw do
  my_draw = Proc.new do
    resources :videos, :only => [:index] do
      member do
        put :enable
        put :disable
      end
    end

    resources :users, :only => [] do
      get :videos
    end

    root :to => "home#leaderboard"

    match '/leaderboard' => "home#leaderboard"
    match '/google34c78ecc55cce2c5' => 'home#google34c78ecc55cce2c5'

    match "/auth/:provider/callback" => "sessions#create"
    match "/signout" => "sessions#destroy", :as => :signout

    resource :search, :only => [:show]

    match "/:permalink", :to => "home#show", :as => "home"
  end

  if ENV['RAILS_RELATIVE_URL_ROOT']
    scope ENV['RAILS_RELATIVE_URL_ROOT'] do
      my_draw.call
    end
  else
    my_draw.call
  end
end
