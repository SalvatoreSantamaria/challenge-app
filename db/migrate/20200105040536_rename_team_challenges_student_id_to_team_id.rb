class RenameTeamChallengesStudentIdToTeamId < ActiveRecord::Migration[5.2]
  def change
    rename_column :scores, :student_id, :team_id
  end
end
