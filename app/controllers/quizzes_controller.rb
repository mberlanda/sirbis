class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.includes(:questions).all
  end

  def show
    @quiz = Quiz.includes(questions: :answers).find(params[:id])
  end

  def random
  end

  def create
    permitted = params.permit(:quiz_name, :questions_count)
    questions = Question.includes(:answers).order('RANDOM()').take(permitted[:questions_count].to_i)
    @quiz = OpenStruct.new(
      id: permitted[:quiz_name],
      due_date: Date.today,
      questions: questions
    )
    render 'show'
  end
end
