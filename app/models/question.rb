class Question < ActiveRecord::Base
  has_many :answers, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: ->(a){ a[:text].blank? }, allow_destroy: true

  def answered?
    answers.map(&:right).include?(true)
  end

  def set_answer(answer_id)
    answers.map(&:to_wrong)
    a = answers.find(answer_id)
    a.right = true
    a.save!
  end
end
