class AddHomeNameToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :home_name, :string
  end
end
