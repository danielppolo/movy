class AddStatusToBikes < ActiveRecord::Migration[5.1]
  def change
    add_column :bikes, :status, :integer
  end
end
