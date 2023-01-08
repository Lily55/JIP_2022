class AddIndexToNums < ActiveRecord::Migration[7.0]
  def change
    add_index :numbers, :num , unique: true
  end
end
