class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :duedate
      t.integer :stock
      t.integer :type
      t.timestamps
    end
  end
end
