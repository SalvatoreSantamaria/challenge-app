class PagesController < ApplicationController # controller inheriting from app controller
    
    skip_before_action: :require_user
    
    def about #directs to app/pages/about.html.erb or localhost:3000/about 
    end
end