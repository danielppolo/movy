class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.references :bike, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
