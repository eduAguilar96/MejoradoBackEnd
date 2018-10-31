class ManyToMany < ActiveRecord::Migration[5.2]
  def change
    create_table :exams_questions, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :question, type: :uuid, index: true
      t.belongs_to :exam, type: :uuid, index: true
      t.timestamps
    end

    create_table :answers_variables, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :variable, type: :uuid, index: true
      t.belongs_to :answer, type: :uuid, index: true
      t.timestamps
    end
  end
end
