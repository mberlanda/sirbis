require 'rails_helper'

RSpec.describe QuizDataHandler do
  
  it 'should create questions and answers from docsity json' do
    expect(Question.count).to eq(0)
    expect(Answer.count).to eq(0)

    QuizDataHandler.upload_docsity()

    expect(Question.count).to eq(66)
    expect(Answer.count).to eq(198)
  end
end
