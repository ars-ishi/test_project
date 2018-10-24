class AddTargetSalesToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :target_sales, :integer
    add_column :projects, :deadline, :datetime
  end
end
