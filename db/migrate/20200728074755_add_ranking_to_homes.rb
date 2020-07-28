class AddRankingToHomes < ActiveRecord::Migration[6.0]
  def change
    add_column :homes, :ranking, :string
  end
end
