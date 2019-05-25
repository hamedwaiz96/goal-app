class AddIndexToUserComments < ActiveRecord::Migration[5.2]
  def change
    add_index :user_comments, :author_id
    add_index :user_comments, :user_id
  end
end
