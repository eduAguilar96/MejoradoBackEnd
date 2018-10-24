class SubjectChilds < ActiveRecord::Migration[5.2]
  def change
    create_table :exams, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :subject, type: :uuid
      t.string :name
      t.string :institution
      t.string :professor
      t.timestamps
    end

    create_table :questions, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.belongs_to :subject, type: :uuid
      t.integer :type
      t.string :name
      t.string :text
      t.string :equation
      t.boolean :random_order, default: true
    end
  end
end
