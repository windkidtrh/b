class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.float :original_thinckness
      t.float :current_thinckness
      t.integer :num
      t.references :equip, foreign_key: true

      t.timestamps
    end
    add_index :points, [:equip_id, :created_at]
  end
end
