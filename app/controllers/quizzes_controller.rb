class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.includes(:questions).all
  end

  def show
    @quiz = Quiz.includes(questions: :answers).find(params[:id])
  end
end