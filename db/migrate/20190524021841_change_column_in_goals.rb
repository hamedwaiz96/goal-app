class ChangeColumnInGoals < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :details, :text
  end
end
