class VariablesController < ApplicationController
  before_action :set_variable, only: [:show, :edit, :update, :destroy]

  def index
    @variables = Variable.all
    json_response(@variables)
  end

  def create
    @variable = Variable.create!(variable_params)
    json_response(@variable, :created)
  end

  def show
    json_response(@variable)
  end

  def update
    @variable.update(variable_params)
    head :no_content
  end

  def destroy
    @variable.destroy
    head :no_content
  end

  private
    def set_variable
      @variable = Variable.find(params[:id])
    end

    def variable_params
      params.require(:variable).permit(
        :tipo,
        :low_num,
        :high_num,
        :low_den,
        :high_den
      )
    end
end
