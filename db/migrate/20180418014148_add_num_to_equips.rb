class AddNumToEquips < ActiveRecord::Migration[5.1]
  def change
    add_column :equips, :num, :integer
  end
end
