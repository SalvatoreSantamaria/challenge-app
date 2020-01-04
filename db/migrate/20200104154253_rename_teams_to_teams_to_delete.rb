class RenameTeamsToTeamsToDelete < ActiveRecord::Migration[5.2]
  def change
    rename_table :teams, :teams_to_delete
  end
end
