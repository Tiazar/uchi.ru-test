Rails.application.routes.draw do
  get 'contributors/show/:owner/:repo/:count', to: 'contributors#show'
end
