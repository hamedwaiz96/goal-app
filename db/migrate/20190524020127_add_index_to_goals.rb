class AddIndexToGoals < ActiveRecord::Migration[5.2]
  def change
    add_index :goals, :user_id
  end
end