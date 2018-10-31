class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
    json_response(@answers)
  end

  def create
    @answer = Answer.create!(answer_params)
    json_response(@answer, :created)
  end

  def show
    json_response(@answer)
  end

  def update
    @answer.update(answer_params)
    head :no_content
  end

  def destroy
    @answer.destroy
    head :no_content
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(
        :question_id,
        :correct,
        :tipo,
        :text,
        :equation
      )
    end
end
