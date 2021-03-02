class RemoveCarImgColumnFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :carImg
  end
end
