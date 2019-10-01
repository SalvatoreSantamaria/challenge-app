class EditCoursesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :team_one_completed, :boolean
    add_column :courses, :team_two_completed, :boolean
  end
end
