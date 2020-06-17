class AddPictureToMemos < ActiveRecord::Migration[6.0]
  def change
    add_column :memos, :picture, :string
  end
end
