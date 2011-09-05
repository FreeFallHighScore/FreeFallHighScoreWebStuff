FreeFallHighScoreWebStuff::Application.routes.draw do
  my_draw = Proc.new do
    match "/auth/:provider/callback" => "sessions#create"
    match "/signout" => "sessions#destroy", :as => :signout

    get "/preservers"  => "home#preservers"
    get "/where"       => "home#where"
    get "/about"       => "home#about"
    get "/disclaimer"  => "home#disclaimer"
    get "/moderate"    => "home#moderate"

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

  if ENV['RAILS_RELATIVE_URL_ROOT']
    scope ENV['RAILS_RELATIVE_URL_ROOT'] do
      my_draw.call
    end
  else
    my_draw.call
  end
end
