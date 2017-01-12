class Quiz < ActiveRecord::Base
  has_many :questions, inverse_of: :quiz
  accepts_nested_attributes_for :questions, reject_if: ->(a){ a[:text].blank? }
end
