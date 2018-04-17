class AddIndexToDevicesName < ActiveRecord::Migration[5.1]
  def change
    add_index :devices, [:user_id, :name], unique: true
  end
end
