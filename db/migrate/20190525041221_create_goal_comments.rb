class CreateGoalComments < ActiveRecord::Migration[5.2]
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
