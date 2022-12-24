class EditUsersAndPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :status
    remove_column :users, :admin
    remove_column :users, :activation_digest
    remove_column :users, :activated
    remove_column :users, :activated_at
    remove_column :users, :remember_token_digest
  end
end
