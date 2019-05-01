Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/lessons", to: "lessons#index", as: "lessons"
  post "/lessons", to: "lessons#create"
  get "/lessons/:id/new", to: "lessons#new", as: "new_lesson"
  get "/lessons/:id", to: "lessons#show", as: "lesson"
  put "/lessons/:id", to: "lessons#update"
  patch "/lessons/:id", to: "lessons#update"
  delete "/lessons/:id", to: "lessons#destroy"
  get "/lessons/:id/edit", to: "lessons#edit", as: "edit_lesson"
end
