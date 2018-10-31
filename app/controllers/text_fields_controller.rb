class TextFieldsController < ApplicationController
  before_action :set_text_field, only: [:show, :edit, :update, :destroy]

  def index
    @text_fields = TextField.all
    json_response(@text_fields)
  end

  def create
    @text_field = TextField.create!(text_field_params)
    json_response(@text_field, :created)
  end

  def show
    json_response(@text_field)
  end

  def update
    @text_field.update(text_field_params)
    head :no_content
  end

  def destroy
    @text_field.destroy
    head :no_content
  end

  private
    def set_text_field
      @text_field = TextField.find(params[:id])
    end

    def text_field_params
      params.require(:text_field).permit(
        :exam_id,
        :key,
        :body
      )
    end
end
