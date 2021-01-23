Rails.application.routes.draw do
  get 'stats/index'
  devise_for :authors
  
  scope module: "authors" do
    get 'stats', to: 'stats#index'
    resources :posts, except: [:show] do
      resources :elements
    end
  end
  
  scope module: "readers" do 
    root to: 'pages#home'
    get '/blog/:id', to: "posts#show", as: :blog_post
  end
end

