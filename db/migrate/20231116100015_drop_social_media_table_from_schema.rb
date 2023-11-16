class DropSocialMediaTableFromSchema < ActiveRecord::Migration[7.0]
  def change
    drop_table :social_media
  end
end
