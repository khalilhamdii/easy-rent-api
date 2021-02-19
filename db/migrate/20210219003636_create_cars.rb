class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :color
      t.string :bodyStyle
      t.string :pricePerDay
      t.string :doors
      t.string :luggages
      t.string :seats
      t.string :emissionClass
      t.string :transmission
      t.string :engine
      t.string :rentDeposit
      t.string :carImg

      t.timestamps
    end
  end
end
