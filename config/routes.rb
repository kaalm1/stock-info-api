Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/favorites', to: 'charts#favorites'
  get '/headers', to: 'charts#chart_header'
end
