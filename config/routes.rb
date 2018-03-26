Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :spreadsheets  do
    member do
      get :tab
      get :range
      get :link
      patch :update_tab
      patch :update_range
      patch :update_link
      get :choose_other
    end

    collection do
      get :js
    end
  end  


  root "spreadsheets#new"
end
