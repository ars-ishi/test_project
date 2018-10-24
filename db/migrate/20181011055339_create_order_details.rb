class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :order_count
      t.integer :confirm_price
      t.integer :confirm_duedate
      t.timestamps
    end
  end
end
