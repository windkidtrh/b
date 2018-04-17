class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.text :introduction
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :devices, [:user_id, :created_at]
  end
end
