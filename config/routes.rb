Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'courses#index' #courses controller, index action.
  get 'courses/new', to: 'courses#new' #goes to courses controller, new action
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  resources :courses
  get 'login', to: 'logins#new' #upon receiving get login request, fire off controller 
  post 'login', to: 'logins#create' #handled by logins controller, create action
  delete 'logout', to: 'logins#destroy' #send request to logins controller, destroy action
  post 'course_enroll', to: 'student_courses#create' #post request to course enroll, to student_courses controller, create action
  get 'download_pdf', to: "application#download_pdf"
end
