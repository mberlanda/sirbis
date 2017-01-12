class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.includes(:answers).find(params[:id])
  end

  def edit
    @question = Question.includes(:answers).find(params[:id])
  end

  def set_answer
    @question = Question.includes(:answers).find(params.require(:id))
    begin
      answer_id = params.require(:answer_id)
      @question.set_answer(answer_id)
      flash[:success] = 'Risposta correttamente aggiornata'
      redirect_to(action: :show)
    rescue ActionController::ParameterMissing => e
      flash[:error] = e.message
      redirect_to(action: :edit)
    end
  end

  def datatable_index
    @response = Question.includes(:answers).all
    @data = @response.map(&format_datatable_index)  # {|q| [q.id, q.text, q.answers.count ] }
    
    respond_to do |format|
      format.json { render 'shared/search' }
    end
  end

  private

  def format_datatable_index
    lambda do |q|
      [
        q.id,
        view_context.link_to(q.text, question_path(q.id), {style:"color:#{q.answered? ? 'green' : 'orangered'};"}),
        q.answers.count
      ]
    end
  end

end