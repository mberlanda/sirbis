class Quiz < ActiveRecord::Base
  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: ->(a){ a[:text].blank? }
end
