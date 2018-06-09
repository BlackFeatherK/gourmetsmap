class Friendship < ApplicationRecord
  validates :friends, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :friend, class_name: "User"
end
