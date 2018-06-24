class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :quiz, foreign_key: true, null: false
      t.string :sentence, null: false
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end
