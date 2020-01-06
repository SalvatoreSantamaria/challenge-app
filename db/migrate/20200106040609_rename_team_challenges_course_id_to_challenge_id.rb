class RenameTeamChallengesCourseIdToChallengeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_challenges, :course_id, :challenge_id
  end
end
