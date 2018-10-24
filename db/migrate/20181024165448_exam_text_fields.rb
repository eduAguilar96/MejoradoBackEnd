class ExamTextFields < ActiveRecord::Migration[5.2]
  def change
    create_table :text_fields, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :exam, type: :uuid
      t.string :key
      t.string :body
      t.timestamps
    end
  end
end
