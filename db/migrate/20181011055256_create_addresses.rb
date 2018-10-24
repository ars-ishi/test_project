class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :prefecture
      t.timestamps
    end
  end
end
