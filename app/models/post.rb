class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tags, dependent: :destroy

  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { minimum: 1500 }
end
