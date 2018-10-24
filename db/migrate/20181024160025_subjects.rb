class Subjects < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'uuid-ossp'
    
    create_table :subjects, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :text
      t.timestamps
    end
  end
end
