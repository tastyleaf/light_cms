Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :spreadsheets  do
    member do
      get :tab
      get :range
      get :link
    end

    collection do
      get :js
    end
  end  


  root "spreadsheets#new"
end
