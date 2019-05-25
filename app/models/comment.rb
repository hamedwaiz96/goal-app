class Comment < ApplicationRecord
  validates :body, :author_id, presence: true
  belongs_to :commentable, polymorphic: true
end
