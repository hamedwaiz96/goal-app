class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.integer :author_id, null: false
      t.text :body, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
