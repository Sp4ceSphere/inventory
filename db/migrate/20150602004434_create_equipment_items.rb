class CreateEquipmentItems < ActiveRecord::Migration
  def change
    create_table :equipment_items do |t|
      t.string :name
      t.string :serial
      t.date :purchase_date
      t.text :comments
      t.integer :equipment_type_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
