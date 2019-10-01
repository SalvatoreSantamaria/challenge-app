class CoursesController < ApplicationController #courses controller inheriting from app controller
    
    skip_before_action :require_user
    
    def index #directs to app/views/courses/index.html.erb
        @courses = Course.all #this make this available to all of the views
    end

    def new
        @course = Course.new
    end
    
    def edit
    end


    def create
        @course = Course.new(course_params)
        if @course.save
            flash[:sucess] = "You have successfully added a challenge" #display a message
            redirect_to root_path
        else 
            render 'new' #in event it doesn't work, then re-render page 
        #for whitelist, have to whitelist for created object
        end
    end

    private

    def course_params
        params.require(:course).permit(:name) #this will whitelist what we receive for the web form, name and email
    end

end