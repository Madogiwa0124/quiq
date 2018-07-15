class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.references :quiz, foreign_key: true, null: false
      t.references :choice, foreign_key: true, null: false
      t.integer :answer_count, default: 0
      t.timestamps
    end
  end
end
