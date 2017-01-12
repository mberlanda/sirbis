class QuestionsController < ApplicationController
  def index
  end

  def datatable_index
    @response = Question.includes(:answers).all
    @data = @response.map{|q| [q.id, q.text, q.answers.count ] }
    
    respond_to do |format|
      format.json { render 'shared/search' }
    end
  end

end