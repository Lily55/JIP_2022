class EditPasswordResetToken < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password_reset_token, :password_reset_token_digest
    rename_column :users, :password_reset_token_sent_at, :password_reset_token_sent_at_digest
  end
end
