class Teams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team_one
      t.string :team_two
      t.timestamps
    end
  end
end
