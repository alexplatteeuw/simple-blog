Rails.application.routes.draw do
  devise_for :authors
  
  scope module: "authors" do 
    resources :posts, except: [:show] do
      resources :elements
    end
  end
  
  scope module: "readers" do 
    root to: 'pages#home'
    get '/blog/:id', to: "posts#show", as: :blog_post
  end
end

