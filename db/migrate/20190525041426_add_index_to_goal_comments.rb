class AddIndexToGoalComments < ActiveRecord::Migration[5.2]
  def change
    add_index :goal_comments, :goal_id
  end
end
