class RemoveColumnsFromBikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :bikes, :consuption, :float
    remove_column :bikes, :consuptiom, :float
  end
end
