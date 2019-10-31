class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :content, presence: true
  validates :signature, presence: true
  validates :user_id, uniqueness: { scope: :movie_id, message: "You have already commented on this movie." }
end

