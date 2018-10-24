class AddTotalSalesToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :total_sales, :integer
  end
end
