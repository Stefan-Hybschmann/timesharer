class CreateOwnerships < ActiveRecord::Migration[6.0]
  def change
    create_table :ownerships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :home, null: false, foreign_key: true
      t.float :shares_of_ownership
      t.boolean :is_admin

      t.timestamps
    end
  end
end
