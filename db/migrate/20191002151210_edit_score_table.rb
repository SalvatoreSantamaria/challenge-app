class EditScoreTable < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :team_score, :integer
    remove_column :scores, :team_one
    remove_column :scores, :team_two
  end
end
