class RenameCoursesToChallenges < ActiveRecord::Migration[5.2]
  def change
    rename_table :courses, :challenges
  end
end
