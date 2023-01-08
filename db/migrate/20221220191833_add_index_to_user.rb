class AddIndexToUser < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :username, unique: true
    add_index :numbers, :num, unique: true
  end
end
