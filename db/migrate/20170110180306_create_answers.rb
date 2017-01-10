class CreateAnswers < ActiveRecord::Migration[5.0]
  def up
    create_table :answers do |t|
      t.text :text, null:false
      t.boolean :right

      t.timestamps null:false
    end

    add_reference :answers, :question, index: true, foreign_key: true
  end

  def down
    drop_table :answers
  end
end

class Question < ActiveRecord::Base
  has_many :answers
end

class Answer < ActiveRecord::Base
  belongs_to :question
end
