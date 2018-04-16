class AddConsumptionToBikes < ActiveRecord::Migration[5.1]
  def change
    add_column :bikes, :consumption, :float
  end
end
