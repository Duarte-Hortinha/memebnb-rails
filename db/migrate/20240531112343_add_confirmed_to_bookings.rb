class AddConfirmedToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :confirmed, :boolean, default: false
  end
end
