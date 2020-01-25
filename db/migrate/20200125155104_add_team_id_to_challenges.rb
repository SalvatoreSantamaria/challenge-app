class AddTeamIdToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :team_id, :integer
  end
end
