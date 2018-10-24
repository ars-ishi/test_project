class AddProjectToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :project, foreign_key: true
  end
end
