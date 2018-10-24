class RemoveTypeFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :type, :integer
  end
end
