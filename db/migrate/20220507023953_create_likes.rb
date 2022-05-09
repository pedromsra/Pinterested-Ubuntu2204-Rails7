class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, foreign_key: {on_delete: :cascade}
      t.references :pin, null: false, foreign_key: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
    add_index :likes, [:user_id, :pin_id], unique: true
  end
end
