class AddNumToDevices < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :num, :integer
  end
end
