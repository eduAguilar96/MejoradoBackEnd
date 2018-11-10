class AddNameToVariables < ActiveRecord::Migration[5.2]
  def change
    add_column :variables, :name, :string
  end
end
