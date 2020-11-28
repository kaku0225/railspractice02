Rails.application.routes.draw do

  root 'books#index'

  resource :user , controller: 'registrations', only:[:create, :edit, :update] do 
    get '/sign_up' , action: 'new'
  end

  resource :user , controller: 'sessions' , only:[] do
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create'
    delete '/logout', action: 'destroy'
  end


 resources :books do
  resources :posts, shallow: true
 end
end
