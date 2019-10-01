class StudentCoursesController < ApplicationController 
    def create
        course_to_add = Course.find(params[:course_id]) #find the course bases on course we are sending in
        unless current_user.courses.include?(course_to_add)#create association only ifcurrent user isnt already enrolled in couse
            StudentCourse.create(course: course_to_add, student: current_user)#rails will extract id from here and use to in the association
            flash[:notice] = "You have successfully enrolled in #{course_to_add.name}"
            redirect_to current_user
        else  
            flash[:notice] = "Something was wrong with your enrollment"
            redirect_to root_path
        end
    end
end