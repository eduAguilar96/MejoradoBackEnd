class QuestionChilds < ActiveRecord::Migration[5.2]
  def change
    create_table :variables, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :question, type: :uuid
      t.integer :tipo
      t.integer :low_num
      t.integer :high_num
      t.integer :low_den, default: 1
      t.integer :high_den, default: 1
      t.timestamps
    end

    create_table :answers, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :question, type: :uuid
      t.boolean :correct
      t.integer :tipo
      t.string :text
      t.string :equation
      t.timestamps
    end
  end
end
