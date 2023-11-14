class CreateSocialMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :social_media do |t|
      t.string :link_address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
