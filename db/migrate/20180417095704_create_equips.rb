class CreateEquips < ActiveRecord::Migration[5.1]
  def change
    create_table :equips do |t|
      t.string :specie
      t.string :name
      t.string :manufacturer
      t.string :material
      t.string :specification
      t.references :device, foreign_key: true

      t.timestamps
    end
    add_index :equips, [:device_id, :created_at]
  end
end
