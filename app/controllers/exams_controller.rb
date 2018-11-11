class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :generate]

  def index
    @exams = Exam.all
    json_response(@exams)
  end

  def create
    @exam = Exam.create!(exam_params)
    json_response(@exam, :created)
  end

  def show
    render :json => @exam, :include => [:text_fields, :questions]
  end

  def update
    @exam.update(exam_params)
    params[:questions].each do |q|
      @exam.questions << Question.find(q[:id])
    end
    head :no_content
  end

  def destroy
    @exam.destroy
    head :no_content
  end

  def generate
    render :json =>
    {
      subject: @exam.subject.text,
      name: @exam.name,
      institution: @exam.institution,
      professor: @exam.professor,
      text_fields: @exam.text_fields,
      questions: gen_questions
    }
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def set_variables(question)
    @variables = gen_variables(question.variables)
  end

  def gen_variables(variables)
    # vars = []
    # variables.each do |v|
    #   vars << {
    #     v.name => rand(
    #       (v.low_num.to_i/v.low_den.to_i)..(v.high_num.to_i/v.high_den.to_i))
    #   }
    # end
    # vars
    vars = Hash.new(0)
    variables.each do |v|
      vars[v.name] = rand(
            (v.low_num.to_i/v.low_den.to_i)..(v.high_num.to_i/v.high_den.to_i))
    end
    vars
  end

  def gen_questions
    questions = []
    @exam.questions.each do |q|
      set_variables(q)
      questions << {
        name: q.name,
        text: q.text,
        tipo: q.tipo,
        equation: parse_equation(q.equation),
        answers: gen_answers(q),
        variables: @variables
      }
    end
    questions
  end

  def gen_answers(q)
    answers = []
    q.answers.each do |ans|
      answers << {
        correct: ans.correct,
        tipo: ans.tipo,
        text: ans.text,
        equation: parse_equation(ans.equation)
      }
    end
    answers
  end

  def parse_equation(e)
    @variables.each do |key, value|
      e = e.gsub(key, value.to_s)
    end

    while e.include?("{")
      replace = e[/\{.*?\}/]
      op = replace.gsub(/[{}]/, "")
      calculator = Dentaku::Calculator.new
      op = calculator.evaluate(op).to_s
      e = e.gsub(replace, op)
    end
    e
  end

  def exam_params
    params.require(:exam).permit(
      :subject_id,
      :name,
      :institution,
      :professor,
      text_fields_attributes:[
        :key,
        :body
      ]
    )
  end

  def questions_params
    params.require(:questions).permit(
      [
        :id
      ]
    )
  end
end
