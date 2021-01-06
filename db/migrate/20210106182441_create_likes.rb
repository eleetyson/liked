class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string :tid
      t.string :url
      t.integer :follow_id

      t.timestamps
    end
  end
end
