class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :country
      t.string :city
      t.string :address
      t.integer :maximum_no_of_guest
      t.integer :no_of_bed

      t.timestamps
    end
  end
end
