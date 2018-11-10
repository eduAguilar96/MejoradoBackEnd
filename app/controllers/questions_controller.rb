class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
    json_response(@questions)
  end

  def create
    @question = Question.create!(question_params)
    json_response(@question, :created)
  end

  def show
    render :json => @question, :include => [:variables, :answers]
  end

  def update
    @question.update(question_params)
    head :no_content
  end

  def destroy
    @question.destroy
    head :no_content
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :subject_id,
      :tipo,
      :name,
      :text,
      :equation,
      :random_order,
      variables_attributes: [
        :tipo,
        :low_num,
        :high_num,
        :low_den,
        :high_den,
        :name
      ],
      answers_attributes: [
        :correct,
        :tipo,
        :text,
        :equation
      ]
    )
  end
end
