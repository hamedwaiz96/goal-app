class ChangeGoalsNull < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :details, :text, null: true
  end
end
