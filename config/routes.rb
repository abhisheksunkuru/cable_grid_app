Rails.application.routes.draw do
  root to: 'dashboard#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard/leaderboard'
end
