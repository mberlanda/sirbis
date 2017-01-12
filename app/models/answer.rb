class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers

  def to_wrong
    self.right = false
    self.save!
  end
end
