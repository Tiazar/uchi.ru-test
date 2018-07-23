Rails.application.routes.draw do
  root 'welcome#index'

  get 'contributors', to: 'welcome#contributors'
end
