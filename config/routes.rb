SseJumble::Application.routes.draw do

  get "diagnostics/index"

  match '/scoreboard', :to => 'scoreboard#index'
  match '/scoreboard/index', :to => 'scoreboard#index'

  resources :submissions
  resources :people

  # omniauth routes
  match '/auth/:provider/callback', :to => 'sessions#callback'
  match '/auth/failure', :to => 'sessions#login_failure'
  match '/auth/sign_out', :to => 'sessions#sign_out'

  root :to => "root#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
