class AddAddressToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :point_adrr,  :string, default:"", null: false
    add_column :users, :device_adrr, :string, default:"", null: false
    add_column :users, :equip_adrr,  :string, default:"", null: false
  end
end
