class EditStudentTable < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :score_id, :integer
  end
end
