class AddCategoryColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :category, :string, array: true, default: []
  end
end
