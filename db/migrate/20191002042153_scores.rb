class Scores < ActiveRecord::Migration[5.2]
  def change
      create_table :scores do |t|
      t.integer :team_one
      t.integer :team_two
      t.timestamps
    end
  end
end
