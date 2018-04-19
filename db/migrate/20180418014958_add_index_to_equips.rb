class AddIndexToEquips < ActiveRecord::Migration[5.1]
  def change
    add_index :equips, [:device_id, :num, :name, :specie], unique: true
  end
end
