Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :spreadsheets  do
    member do
      get :tab
      get :range
      get :link
      get :update_tab
      get :update_range
      get :update_link
    end

    collection do
      get :js
    end
  end  


  root "spreadsheets#new"
end
