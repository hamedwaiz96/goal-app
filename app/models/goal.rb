class Goal < ApplicationRecord
  validates :content, presence: true

  belongs_to :user

  has_many :goal_comments,
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: 'GoalComment',
    dependent: :destroy
end
