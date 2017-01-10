class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
end
