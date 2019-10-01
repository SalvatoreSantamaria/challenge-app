class AddingPointTotalsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :team_one_points_total, :integer
    add_column :courses, :team_two_points_total, :integer
  end
end
