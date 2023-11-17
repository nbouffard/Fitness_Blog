class RemoveDefaultAndArrayFromCategoryColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :category, :string, default: nil, array: false
  end
end
