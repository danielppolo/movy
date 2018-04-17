class ChangeStatusToBikes < ActiveRecord::Migration[5.1]
  def change
    change_column :bikes, :status, :integer,  default: 0, null: false
  end
end
