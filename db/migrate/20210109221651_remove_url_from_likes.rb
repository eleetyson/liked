class RemoveUrlFromLikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :likes, :url, :string
  end
end
