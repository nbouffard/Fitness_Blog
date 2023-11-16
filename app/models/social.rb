class Social < ApplicationRecord
  belongs_to :user

  validates :link, presence: true, format: {
    with: %r{\A((http|https)://)?[a-z0-9]+([-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?\z}ix,
    message: 'Invalid URL'
  }
end
