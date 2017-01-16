class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.includes(:questions).all
  end
end