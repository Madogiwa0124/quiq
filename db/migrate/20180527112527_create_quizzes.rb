class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :title, null:false
      t.text :body
      t.text :explanation

      t.timestamps
    end
  end
end
