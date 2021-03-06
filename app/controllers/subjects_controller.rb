class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
    json_response(@subjects)
  end

  def create
    @subject = Subject.create!(subject_params)
    json_response(@subject, :created)
  end

  def show
    render :json => @subject, :include => [:questions]
  end

  def update
    @subject.update(subject_params)
    head :no_content
  end

  def destroy
    @subject.destroy
    head :no_content
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(
        :text
      )
    end
end
