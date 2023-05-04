class AddTotalToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :total, :decimal
  end
end
