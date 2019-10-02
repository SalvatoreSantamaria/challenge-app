class StudentCoursesController < ApplicationController 
    def create
        course_to_add = Course.find(params[:course_id]) #find the course bases on course we are sending in
        unless current_user.courses.include?(course_to_add)#create association only ifcurrent user isnt already enrolled in couse
            #i think this is just creating the relationship.
            StudentCourse.create(course: course_to_add, student: current_user)#rails will extract id from here and use to in the association

            #how to add point total?
            StudentCourse.create(course: course_to_add, student: current_user) #this needs to add the points. they need to be added to ____? i think their own model?
            #Team.create(something here that added the points?)

            flash[:notice] = "You have successfully completed #{course_to_add.name}"
            redirect_to current_user
        else  
            flash[:notice] = "Something was wrong with your enrollment"
            redirect_to root_path
        end
    end
end