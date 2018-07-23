Rails.application.routes.draw do
  get "diplom/show/:login", to: "diplom#show"
end
