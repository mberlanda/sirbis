class CreateQuestions < ActiveRecord::Migration[5.0]
  def up
    create_table :questions do |t|
      t.text :text

      t.timestamps null:false
    end
  end

  def down
    drop_table :questions
  end
end

class Question < ActiveRecord::Base
end