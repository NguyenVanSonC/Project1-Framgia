class Following < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: Product.name
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
