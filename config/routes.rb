Rails.application.routes.draw do

  resources :advertisements,:posts,:questions

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end