class CreateQuizzes < ActiveRecord::Migration[5.0]
  def up
    create_table :quizzes do |t|
      t.string :name
      t.date :due_date

      t.timestamps null:false
    end

    add_reference :questions, :quiz, index: true, foreign_key: true
  end

  def down
    drop_table :quizzes
  end

end
