class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  def index
    @exams = Exam.all
    json_response(@exams)
  end

  def create
    @exam = Exam.create!(exam_params)
    json_response(@exam, :created)
  end

  def show
    json_response(@exam)
  end

  def update
    @exam.update(exam_params)
    head :no_content
  end

  def destroy
    @exam.destroy
    head :no_content
  end

  private
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def exam_params
      params.require(:exam).permit(
        :subject_id,
        :name,
        :institution,
        :professor
      )
end
