class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { minimum: 1500 }
end
