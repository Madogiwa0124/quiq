class AddCtypeImageToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :ctype, :string
    add_column :quizzes, :image, :binary
  end
end
