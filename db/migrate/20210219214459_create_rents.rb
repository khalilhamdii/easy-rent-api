class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.string :userName
      t.string :model
      t.boolean :status
      t.string :pickUpDate
      t.string :pickUpTime
      t.string :returnDate
      t.string :returnTime
      t.string :location
      t.string :pricePerDay
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
