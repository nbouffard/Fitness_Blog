class Category < ApplicationRecord
  has_many :posts, depenent: :destroy
end
