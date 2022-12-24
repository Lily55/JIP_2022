class EditPostsRole < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :access, :forwhom
  end
end
