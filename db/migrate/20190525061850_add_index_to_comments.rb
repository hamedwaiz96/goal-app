class AddIndexToComments < ActiveRecord::Migration[5.2]
  def change
    add_index :comments, :author_id
    add_index :comments, :commentable_id
  end
end
