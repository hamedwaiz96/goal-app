class GoalComment < ApplicationRecord
  validates :goal_id, :body, presence: true

  belongs_to :goal,
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: 'Goal'
end
