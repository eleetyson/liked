class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.string :uid
      t.string :name
      t.string :handle
      t.integer :user_id

      t.timestamps
    end
  end
end
