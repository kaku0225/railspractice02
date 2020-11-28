class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :title, presence: true
  validates :content, presence: true

  def owned_by?(user)
    user == self.user
  end
end
