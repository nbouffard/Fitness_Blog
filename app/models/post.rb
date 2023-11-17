class Post < ApplicationRecord
  belongs_to :user
  # has_many :post_tags, dependent: :destroy
  # has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy
  # accepts_nested_attributes_for :tags, reject_if: :all_blank

  CATEGORIES = ['one', 'two', 'three']
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { minimum: 15 }
  validates :category, presence: true
end
