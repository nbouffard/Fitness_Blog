class Tag < ApplicationRecord
  belongs_to :post
  validates :tag_name, presence: true
end
