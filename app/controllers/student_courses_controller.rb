class StudentCoursesController < ApplicationController 
    def create
        course_to_add = Course.find(params[:course_id]) #find the course bases on course we are sending in
        unless current_user.courses.include?(course_to_add)#create association only ifcurrent user isnt already enrolled in couse
            #i think this is just creating the relationship.
            StudentCourse.create(course: course_to_add, student: current_user)#rails will extract id from here and use to in the association
            #create will hit the db directly


            #how to add point total?
            #do I need to find the course.team, which doesn't exist?
            #team = Course.find(params[:team_id]) #do I need to create :team_id? it does not exist

            #current users challenge,
            #current_user.courses.student_id 

            #table is score, score.team_score stores the points, and student_id: 1 is team_one and student_id: 2 is team_two
            #probably need to use .update()
            #student = Student.find(params[:student_id])
            student = Student.find(2)
            test = student.scores.find(2).team_score #hard coding to test. now do I save or just write this correctly?
            test = test + 1
            puts test

            #in db, student.scores = nil
            #hm, its going to be somthing like student.scores.team_score

            #
            #something here that added the points?
            flash[:notice] = "You have successfully completed #{course_to_add.name}"
            redirect_to current_user
        else  
            flash[:notice] = "Something was wrong with your enrollment"
            redirect_to root_path
        end
    end
end