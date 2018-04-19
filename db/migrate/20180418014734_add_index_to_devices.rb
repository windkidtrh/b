class AddIndexToDevices < ActiveRecord::Migration[5.1]
  def change
    add_index :devices, [:user_id, :num, :name], unique: true
  end
end
