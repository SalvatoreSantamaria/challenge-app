Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'challenges#index' #challenges controller, index action.
  get 'challenges/new', to: 'challenges#new' #goes to challenges controller, new action
  get 'challenges/edit', to: 'challenges#edit'
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  resources :challenges
  get 'login', to: 'logins#new' #upon receiving get login request, fire off controller 
  post 'login', to: 'logins#create' #handled by logins controller, create action
  delete 'logout', to: 'logins#destroy' #send request to logins controller, destroy action
  post 'challenge_enroll', to: 'student_challenges#create' #post request to challenge enroll, to student_challenges controller, create action
  
  delete 'challenge_destroy', to: 'student_challenges#destroy' #request to challenge unenroll, to student_challenges controller, unenroll action

  get 'download_pdf', to: "application#download_pdf"
end
