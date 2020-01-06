class RenameTeamChallengesStudentIdToTeamIdTryTwo < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_challenges, :student_id, :team_id
  end
end
