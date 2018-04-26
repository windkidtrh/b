class CreatePgrades < ActiveRecord::Migration[5.1]
  def change
    create_table :pgrades do |t|
      t.float :severe_point, default: 0.5
      t.float :minor_point,  default: 0.8
      t.integer :point_num
      t.integer :equip_id
      t.timestamps
    end
    add_index :pgrades, [:equip_id, :point_num], unique: true
  end
end
