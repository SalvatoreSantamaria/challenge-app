class CompletedChallengesForTeams < ActiveRecord::Migration[5.2]
  def change
      create_table :points do |t|
      t.integer :team_one_points_total
      t.integer :team_two_points_total
      t.timestamps
    end
  end
end
