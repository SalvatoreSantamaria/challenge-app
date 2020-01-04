class RenameStudentsToTeams < ActiveRecord::Migration[5.2]
  def change
    rename_table :students, :teams
  end
end
