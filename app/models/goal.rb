class Goal < ApplicationRecord
  include Commentable
  
  validates :content, presence: true

  belongs_to :user

end
