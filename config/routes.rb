Rails.application.routes.draw do
  devise_for :authors
  root to: 'pages#home'
  scope module: "authors" do 
    resources :posts, except: [:show] do
      resources :elements
    end
  end
end

