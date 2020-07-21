class BookingDateFields < ActiveRecord::Migration[6.0]
  def change
    change_table :bookings do |t|
      t.remove :start_date, :end_date
    end
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
