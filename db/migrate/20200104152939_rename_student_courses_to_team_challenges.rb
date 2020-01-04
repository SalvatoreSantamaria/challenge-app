class RenameStudentCoursesToTeamChallenges < ActiveRecord::Migration[5.2]
  def change
    rename_table :student_courses, :team_challenges
  end
end
