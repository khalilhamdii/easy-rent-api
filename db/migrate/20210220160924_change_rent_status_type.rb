class ChangeRentStatusType < ActiveRecord::Migration[6.0]
  def change
    change_column :rents, :status, :string
  end
end
