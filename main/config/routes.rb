Rails.application.routes.draw do
  root 'welcome#index'

  get 'contributors', to: 'welcome#contributors'
  get 'diplom/:login/', to: 'welcome#diplom', as: 'diplom'
end
