class AddingPointsField < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :challenge_points, :integer
  end
end
