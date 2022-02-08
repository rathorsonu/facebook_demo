class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.string :likeable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
