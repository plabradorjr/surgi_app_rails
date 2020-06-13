class AddImageIdToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :image_id, :string
  end
end
