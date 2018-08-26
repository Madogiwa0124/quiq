class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :quiz, foreign_key: true, null: false
      t.integer :like_count, default: 0
      t.timestamps
    end
  end
end
