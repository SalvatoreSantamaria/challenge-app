class AddAssociationBetweenScoreAndStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :student_id, :integer
  end
end
